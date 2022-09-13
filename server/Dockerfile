FROM gradle:5.6.4-jdk8

MAINTAINER Toby <me@tobyan.com>

LABEL Version="2.0"
LABEL Name="fisco-bcos-browser 2.0"
LABEL Description="Oracle Jre 8 + gradle 5.6.4"

# sed permission denied
USER root

# python package
RUN sed -i 's/archive.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y git python3-pip \
    && pip3 install PyMySQL


RUN git clone --depth=1 https://github.com/toby1991/fisco-bcos-browser.git /fisco-bcos-browser

WORKDIR /fisco-bcos-browser/server/fisco-bcos-browser
RUN gradle build
RUN cp dist/conf_template dist/conf -r

WORKDIR /fisco-bcos-browser/server/fisco-bcos-browser/dist/

RUN chmod +x ./start.sh

CMD ["sh", "start.sh"]
