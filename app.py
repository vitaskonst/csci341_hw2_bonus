from flask import Flask

app = Flask(__name__)

@app.route('/', methods=['GET'])
def homepage():
	return 'lol kek cheburek'


if __name__ == '__main__':
	app.run(debug=True)