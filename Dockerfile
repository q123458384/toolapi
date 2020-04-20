# 基础镜像
FROM python:3.6-alpine

# 维护者信息
LABEL maintainer "AragonSnow <https://github.com/AragonSnow/toolapi>"

ADD . /usr/src/app1
WORKDIR /usr/src/app1


# 基础镜像已经包含pip组件
RUN apk update \
    && mkdir -p /usr/src/app1 \
    && pip3 install -r requirements.txt

   
ENV PORT 80
EXPOSE $PORT/tcp

# timezone
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENV TZ=Asia/Shanghai

# 添加挂载点
VOLUME ["/usr/src/app1/"]

CMD ["python3","/usr/src/app1/main.py"]
