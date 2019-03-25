# fisco-bcos-browser-browser

A docker version for deploying [fisco-bcos-browser](https://github.com/FISCO-BCOS/fisco-bcos-browser) easily.\
一个 Docker 版本的 [fisco-bcos-browser](https://github.com/FISCO-BCOS/fisco-bcos-browser)， 方便一键部署。如果有好的意见或者想法欢迎提 issue 。

## How to use 如何使用

1. 修改 `./server/Dockerfile` 和 `./web/Dockerfile` 中的配置. 如数据库密码、域名、端口
2. 修改 `docker-compose.yml` 中第 19 行 `- ~/*/build:/bcos-data` 的 `~/*/build`， 修改为包含 node0/、node1/ 的目录。
3. docker-compose build
4. docker-compose up -d

## Files description 文件描述

* Dockerfile \
  A dockerfile to build an image. 用来建立 Docker 镜像
* README.md
* docker-compose.yml \
  docker-compose 脚本
* tomcat/ \
  For tomcat building. 跑 tomcat 的脚本，可以不用管它。

