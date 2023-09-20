FROM tiangolo/uwsgi-nginx:python3.11
WORKDIR /code
ENV STATIC_URL /static
ENV STATIC_PATH /code/static
COPY requirements.txt /code/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
COPY * /code
CMD python ./flask_server/app.py