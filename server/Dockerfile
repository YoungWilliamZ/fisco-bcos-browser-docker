FROM gradle:jdk8

MAINTAINER YoungWilliam <youngwilliam.zheng@gmail.com>

LABEL Version="2.0"
LABEL Name="fisco-bcos-browser 2.0"
LABEL Description="Oracle Jre 8 + gradle 5.2.1"

# python package
RUN apt-get update && apt-get install -y python-pip libmysqlclient-dev && pip install MySQL-python requests

RUN git clone https://github.com/FISCO-BCOS/fisco-bcos-browser.git /fisco-bcos-browser

WORKDIR /fisco-bcos-browser/server/fisco-bcos-browser
RUN gradle build
RUN cp dist/conf_template dist/conf -r

WORKDIR /fisco-bcos-browser/server/fisco-bcos-browser/dist/

RUN chmod +x ./start.sh

CMD ["sh", "start.sh"]