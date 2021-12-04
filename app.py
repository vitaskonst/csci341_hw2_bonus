from settings import DATABASE_URL

import click
from flask import Flask
from flask.cli import with_appcontext

from pathlib import Path
from sqlalchemy.engine.base import Engine
from sqlalchemy import text, create_engine


app = Flask(__name__)
engine = create_engine(DATABASE_URL, echo=False)


@click.command(name='init-db')
@with_appcontext
def init_db():
	filepath = Path('db/init.sql')

	with engine.begin() as conn:
		for query in [x.strip() for x in filepath.read_text().split(';') if x.strip()]:
			conn.execute(text(query))

	print('All tables were created successfully')


@click.command(name='fill-mock-db')
@with_appcontext
def fill_mock_db():
	filepath = Path('db/mock.sql')

	with engine.connect() as conn:
		for query in [x.strip() for x in filepath.read_text().split(';') if x.strip()]:
			conn.execute(text(query))

	print('All rows were inserted successfully')


app.cli.add_command(init_db)
app.cli.add_command(fill_mock_db)


@app.route('/', methods=['GET'])
def homepage():
	with engine.connect() as conn:
		users = conn.execute("""
			SELECT email FROM Users;
		""").fetchall()

	return {
		'users': [user[0] for user in users]
	}
