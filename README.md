# fisco-bcos-browser-browser

> Support FISCO-BCOS 2

A docker version for deploying [fisco-bcos-browser](https://github.com/FISCO-BCOS/fisco-bcos-browser) easily.\
一个 Docker 版本的 fisco-bcos-browser， 方便一键部署。如果有好的意见或者想法欢迎提 issue 。

## Dependencies 依赖

1. [Docker](https://www.docker.com/get-started)
2. [docker-compose](https://docs.docker.com/compose/install/)

## How to use 如何使用

``` sh
# cd to this repo
docker-compose up -d --build
```

**注**：如果访问 github 速度慢，请切换到 [master-gitee](https://github.com/YoungWilliamZ/fisco-bcos-browser-docker/tree/master-gitee) 分支。

## Get the log of backend 查看日志

``` sh
docker logs fisco-bcos-browser-docker_fbb_back_1 -f
```
