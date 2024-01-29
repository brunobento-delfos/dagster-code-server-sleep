FROM python:3.11-slim as base

WORKDIR /build

RUN pip install --upgrade pip
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git

COPY ./setup.py ./
COPY ./setup.cfg ./

RUN pip install .

# Code server
FROM base as code
WORKDIR /opt/dagster/app
COPY ./src/ ./src

# Webserver and daemon
FROM base as dagster
ENV DAGSTER_HOME=/opt/dagster/dagster_home/
RUN mkdir -p $DAGSTER_HOME
WORKDIR $DAGSTER_HOME
