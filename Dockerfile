FROM python:3.11-slim

LABEL org.opencontainers.image.authors="admin@9ikj.cn"
LABEL org.opencontainers.image.source="https://github.com/9ikj/docker-bilichat"

RUN apt-get update -y

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN pip install nonebot2[fastapi] nonebot-adapter-onebot

RUN pip install bilichat-request nonebot-plugin-bilichat

RUN mkdir -p /opt/bilichat

WORKDIR /opt/bilichat

COPY bot.py bot.py
COPY .env .env
COPY config.yaml config.yaml

EXPOSE 8080

CMD [ "python", "./bot.py" ]