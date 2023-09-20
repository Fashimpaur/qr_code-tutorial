# QR Code Tutorial

This tutorial assumes you already know how to set up a virtual environment for development of a Python application.  If a tutorial is needed for this, please comment and it can be added but this is readily available in multiple places on the internet.

Lets set up a basic project to begin so that on your machine, you have a directory structure like this:



## Setup

In a terminal window, you will need to install the flask module in your project’s virtual environment:

```bash
(venv) ~/Projects/my_project$ pip install flask
```

Once the module is installed, in your project directory, using the IDE of your choice, create an empty file, *app.py*, in the main directory. Also, create empty files for  *Dockerfile* and *docker-compose.yml*.

```bash
touch app.py
touch Dockerfile
touch docker-compose.yml
```

Now that we have the files, lets create a simple flask app in app.py:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/make_pdf/', methods=['GET'])
def create_pdf_document():
    return 'Success'

if __name__ == '__main__':
    app.run(host='0.0.0.0')

```

We now need a requirements file for building the code in the Docker container.  You can generate this using **pip** or **poetry** or whichever other means you desire but for ease of this tutorial, we are just using **pip**.

```bash
(venv) ~/Projects/my_project$ pip freeze > requirements.txt
```

This will put a requirements.txt file in your project and these may be different from the example which is okay. For my example, the requirements captured are:

```
blinker==1.6.2
click==8.1.7
colorama==0.4.6
Flask==2.3.3
itsdangerous==2.1.2
Jinja2==3.1.2
MarkupSafe==2.1.3
Werkzeug==2.3.7

```

Now lets add content to our **docker-compose.yml** file.

```yaml
services:
  web:
    build: .
    container_name: qr_code_web
    ports:
      - '5000:5000'
    volumes:
      - .:/code
```

Lastly, lets add the **Dockerfile** content:

```docker
FROM python:3.11-alpine
WORKDIR /code
COPY requirements.txt /code
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
COPY . /code
CMD python app.py
```

Now, in a terminal, with Docker running, start your Docker container using ***docker-compose up*** 

```
(venv) ~/Projects/my_project$ docker-compose up
```

Once the container is created and started, from a web browser, you should be able to go to the URL 
http://localhost:5000/make_pdf/ and get the following result:

![Success Result](D:\dfashimpaur\Projects\qr_code-tutorial\tutorial_setup\resources\success.jpg)