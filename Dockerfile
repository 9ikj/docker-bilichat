FROM python:3.11-slim-bullseye

LABEL org.opencontainers.image.authors="admin@9ikj.cn"
LABEL org.opencontainers.image.source="https://github.com/9ikj/docker-bilichat"

RUN apt-get update && \
    apt-get -y install libgl1-mesa-glx

RUN pip install dynamicadaptor dynrender-skia

RUN pip install nonebot2[fastapi] nonebot-adapter-onebot

RUN pip install nonebot-plugin-bilichat[all]

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN mkdir -p /opt/bilichat

WORKDIR /opt/bilichat

COPY bot.py ./bot.py
COPY .env.prod ./.env.prod

EXPOSE 8080

CMD [ "python", "./bot.py" ]