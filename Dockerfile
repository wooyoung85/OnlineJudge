FROM python:3.7-alpine3.9

ENV OJ_ENV production

ADD . /app
WORKDIR /app

RUN apk add --update --no-cache build-base nginx openssl curl unzip supervisor jpeg-dev zlib-dev postgresql-dev freetype-dev && \
    pip install --no-cache-dir -r /app/deploy/requirements.txt && \
    apk del build-base --purge

ENTRYPOINT /app/deploy/entrypoint.sh
