From nginx:1.15.9-alpine

MAINTAINER YoungWilliam <youngwilliam.zheng@gmail.com>


WORKDIR /tmp
RUN apk add git
RUN git clone https://github.com/FISCO-BCOS/fisco-bcos-browser.git && \
    cd fisco-bcos-browser && \
    git checkout dev2.0.0 && \
    mkdir -p /data/app/web/ && \
    mv web/fisco-bcos-browser-front/* /data/app/web/