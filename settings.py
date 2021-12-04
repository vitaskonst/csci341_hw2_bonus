import os

# DEV_DATABASE_URL = 'postgresql+psycopg2://postgres:postgres@localhost:5432/csci341_hw2_task2'

DATABASE_URL = os.environ.get('DATABASE_URL')