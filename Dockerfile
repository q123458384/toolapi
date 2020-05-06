# 基础镜像
FROM python:3.6-alpine

# 维护者信息
LABEL maintainer "AragonSnow <https://github.com/AragonSnow/toolapi>"

ADD . /app/toolapi
WORKDIR /app/toolapi


# 基础镜像已经包含pip组件
RUN apk update \
    && mkdir -p /app/toolapi \
    && apk add --no-cache git \
    && git clone https://github.com/q123458384/toolapi.git /app/toolapi \
    && pip3 install --no-cache-dir -r requirements.txt

   
ENV PORT 80
EXPOSE $PORT/tcp

# timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENV TZ=Asia/Shanghai

CMD git pull && \
    pip3 install --no-cache-dir -r requirements.txt && \
    python3 ./main.py
