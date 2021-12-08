import os

if os.environ.get('FLASK_ENV') == 'development':
	DATABASE_URL = 'postgresql://postgres:postgres@localhost:5432/csci341_hw2_task2'
else:
	DATABASE_URL = os.environ.get('DATABASE_URL').replace('postgres://', 'postgresql://')
