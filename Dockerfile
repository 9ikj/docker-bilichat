FROM python:3.12-slim-bullseye

LABEL org.opencontainers.image.authors="admin@9ikj.cn"

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

RUN apt-get update && \
    apt-get -y install libgl1-mesa-glx

RUN pip install dynamicadaptor dynrender-skia

RUN pip install nonebot2[fastapi] nonebot-adapter-onebot

RUN pip install nonebot-plugin-bilichat[all]

RUN mkdir -p /opt/bilichat

WORKDIR /opt/bilichat

COPY bot.py ./bot.py
COPY .env.prod ./.env.prod

EXPOSE 8080

CMD [ "python", "./bot.py" ]