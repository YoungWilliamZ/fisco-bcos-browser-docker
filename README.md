# fisco-bcos-browser-browser

A docker version for deploying [fisco-bcos-browser](https://github.com/FISCO-BCOS/fisco-bcos-browser) easily.\
一个 Docker 版本的 [fisco-bcos-browser](https://github.com/FISCO-BCOS/fisco-bcos-browser)， 方便一键部署。如果有好的意见或者想法欢迎提 issue 。

## How to use 如何使用

1. 修改 `deploy_browser.sh` 和 `ReportAgent.py` 中的配置. *注意*: 请一定要改 HOST_IP，不要信它说什么无关
2. 修改 `docker-compose.yml` 中第 19 行 `- ~/*/build:/bcos-data` 的 `~/*/build`， 修改为包含 node0/、node1/ 的目录。
3. docker-compose build
4. docker-compose up -d

## Files description 文件描述

* Dockerfile \
  A dockerfile to build an image. 用来建立 Docker 镜像
* README.md
* ReportAgent.py \
  From [fisco-bcos-browser/report/ReportAgent.py](https://github.com/FISCO-BCOS/fisco-bcos-browser/blob/master/report/ReportAgent.py), you can change the parameters. 请修改在此的某些参数，如`本机器的外网IP`。
* deploy_browser.sh \
  From [fisco-bcos-browser/deploy_browser.sh](https://github.com/FISCO-BCOS/fisco-bcos-browser/blob/master/deploy_browser.sh), 部署 fisco-bcos-browser. 基于源文件有些修改：结尾的
* docker-compose.yml \
  docker-compose 脚本
* tomcat/ \
  For tomcat building. 跑 tomcat 的脚本，可以不用管它。

