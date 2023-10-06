FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y python3-pip \
    python3-dev

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

ADD . /app

RUN useradd --create-home madbot
USER root
RUN chown madbot:madbot -R /app/
USER limitswap

RUN pip install --upgrade pip --no-warn-script-location
RUN pip install -r requirements.txt --no-warn-script-location

CMD ["python", "MadBot.py"]
