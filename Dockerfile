FROM python:3.6-alpine

MAINTAINER Bruno Alla "alla.brunoo@gmail.com"

RUN pip install -U pipenv

WORKDIR /app/

COPY Pipfile Pipfile
COPY Pipfile.lock Pipfile.lock

RUN pipenv install --deploy --system

EXPOSE 5000

COPY . /app/

CMD gunicorn --worker-class quart.worker.GunicornWorker ip:app --bind 0.0.0.0:5000
