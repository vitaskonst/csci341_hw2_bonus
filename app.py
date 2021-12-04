from settings import DATABASE_URL

from sqlalchemy.engine.base import Engine
from sqlalchemy import text, create_engine
from pathlib import Path
from flask import Flask


def init_db(engine: Engine, filepath: Path):
	with engine.begin() as conn:
	    for query in [x.strip() for x in filepath.read_text().split(';') if x.strip()]:
	        conn.execute(text(query))


app = Flask(__name__)
engine = create_engine(DATABASE_URL, echo=False)
init_db(engine, Path('init.sql'))


@app.route('/', methods=['GET'])
def homepage():
	with engine.begin() as conn:
		users = conn.execute("""
			SELECT email FROM Users;
		""").fetchall()

	return {
		'users': [user[0] for user in users]
	}


app.run(debug=True)