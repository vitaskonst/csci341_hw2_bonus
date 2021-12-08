from settings import DATABASE_URL

import os
import click
from flask import Flask, request, render_template, send_from_directory
from pathlib import Path
from flask.cli import with_appcontext
from flask_restful import Resource, Api
from sqlalchemy import text, create_engine, exc


app = Flask(__name__)
api = Api(app)
engine = create_engine(DATABASE_URL, echo=False)


@click.command(name='init-db')
@with_appcontext
def init_db():
	filepath = Path('db/init.sql')

	with engine.begin() as conn:
		for query in [x.strip() for x in filepath.read_text().split(';') if x.strip()]:
			conn.execute(text(query))

	print('All tables were created successfully')

app.cli.add_command(init_db)


@click.command(name='fill-mock-db')
@with_appcontext
def fill_mock_db():
	filepath = Path('db/mock.sql')

	with engine.connect() as conn:
		for query in [x.strip() for x in filepath.read_text().split(';') if x.strip()]:
			conn.execute(text(query))

	print('All rows were inserted successfully')

app.cli.add_command(fill_mock_db)


def success(data=None, message: str = 'Success!', status_code: int = 200):
	response = {
		'status': 'success',
		'message': message
	}

	if data is not None:
		response['data'] = data

	return response, status_code


def failure(message: str = 'Error!', status_code: int = 400):
	return {
		'status': 'failure',
		'message': message
	}, status_code


class UserModel:
	FIELDS = {'email', 'name', 'surname', 'salary', 'phone', 'country'}

	def get_all():
		with engine.connect() as conn:
			users_raw = conn.execute(text("""
				SELECT email, name, surname, salary, phone, cname as country
				FROM Users
				WHERE deleted IS FALSE;
			""")).mappings()
		
		return [{column: user[column] for column in users_raw.keys()} for user in users_raw]

	def get(uid=None, email=None, phone=None):
		if len([arg for arg in [uid, email, phone] if arg is not None]) > 1:
			raise RuntimeError('Too many arguments.')
		
		if uid:
			column = 'uid'
			arg = uid
		elif email:
			column = 'email'
			arg = email
		elif phone:
			column = 'phone'
			arg = phone
		
		try:
			with engine.connect() as conn:
				user = next(conn.execute(text(f"""
					SELECT email, name, surname, salary, phone, cname as country
					FROM Users
					WHERE {column} = :arg AND deleted IS FALSE;
				""").bindparams(arg=arg)).mappings())

			return {column: user[column] for column in user.keys()}
		except StopIteration:
			return None

	def create(email, name, surname, salary, phone, country):
		try:
			with engine.connect() as conn:
				return conn.execute(text("""
					INSERT INTO Users (email, name, surname, salary, phone, cname)
					VALUES (:email, :name, :surname, :salary, :phone, :country)
					RETURNING uid;
				""").bindparams(email=email, name=name, surname=surname, salary=salary, phone=phone, country=country)).fetchone()['uid']
		except exc.IntegrityError as e:
			return None


	def update(uid, email=None, name=None, surname=None, salary=None, phone=None, country=None):
		args = {'email': email, 'name': name, 'surname': surname, 'salary': salary, 'phone': phone, 'country': country}
		args = {key: value for key, value in args.items() if value is not None}

		if args:
			with engine.connect() as conn:
				conn.execute(text(f"""
					UPDATE Users
					SET
					{'email = :email' if 'email' in args else ''}
					{'name = :name' if 'name' in args else ''}
					{'surname = :surname' if 'surname' in args else ''}
					{'salary = :salary' if 'salary' in args else ''}
					{'phone = :phone' if 'phone' in args else ''}
					{'cname = :country' if 'country' in args else ''}
					WHERE uid = :uid
					RETURNING uid;
				""").bindparams(uid=uid, **args))


	def delete(uid):
		with engine.connect() as conn:
			conn.execute(text("""
				UPDATE Users SET deleted = TRUE WHERE uid = :uid RETURNING uid;
			""").bindparams(uid=uid))


class Users(Resource):
	def get(self, uid=None):
		if uid is None:
			data = UserModel.get_all()
			return success(data, 'All users fetched successfully.')
		else:
			user = UserModel.get(uid)
			
			if user is None:
				return failure('No user found with this id.', 404)

			return success(user, 'User fetched successfully.')


	def post(self):
		user_data = request.json

		if set(user_data.keys()) != UserModel.FIELDS:
			return failure('Invalid data format.', 422)
		
		if UserModel.get(email=user_data['email']):
			return failure('User with this email already exists.', 409)

		if UserModel.get(phone=user_data['phone']):
			return failure('User with this phone already exists.', 409)

		new_user_id = UserModel.create(**user_data)
		new_user = UserModel.get(new_user_id)

		return success(new_user, 'User created successfully.')


	def put(self, uid):
		if UserModel.get(uid) is None:
			return failure('No user found with this id.', 404)

		user_data = request.json

		if not set(user_data.keys()).issubset(UserModel.FIELDS):
			return failure('Invalid data format.', 422)

		UserModel.update(uid, **user_data)
		updated_user = UserModel.get(uid)

		return success(updated_user, 'User updated successfully.')


	def delete(self, uid):
		user = UserModel.get(uid)

		if user is None:
			return failure('No user found with this id', 404)

		UserModel.delete(uid)

		return success(user)


api.add_resource(Users, '/users', '/users/<int:uid>')


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                          'favicon.ico', mimetype='image/vnd.microsoft.icon')

@app.route('/', methods=['GET'])
def index():
	return render_template('index.html')