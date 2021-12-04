import os

# DATABASE_URL = 'postgresql://postgres:postgres@localhost:5432/csci341_hw2_task2'
DATABASE_URL = os.environ.get('DATABASE_URL').replace('postgres://', 'postgresql://')