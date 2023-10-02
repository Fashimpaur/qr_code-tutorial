FROM python:3.11-alpine
WORKDIR /code
COPY requirements.txt /code
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
COPY . .
CMD ["python", "./app.py"]