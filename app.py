import os

from flask import Flask

app = Flask(__name__)


@app.route('/make_pdf/', methods=['GET'])
def create_pdf_document():
    return 'Success'


if __name__ == '__main__':
    app.run()