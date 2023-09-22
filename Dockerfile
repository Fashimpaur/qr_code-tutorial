FROM python:3.11-alpine
WORKDIR /code
ENV STATIC_URL /static
ENV STATIC_PATH /code/static
COPY requirements.txt /code
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
COPY ./flask_server /code
CMD python app.py