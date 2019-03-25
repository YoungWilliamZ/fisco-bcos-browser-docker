FROM centos:7

MAINTAINER YoungWilliam <youngwilliam.zheng@gmail.com>

LABEL Version="2.0"
LABEL Name="fisco-bcos-browser 2.0"
LABEL Description="Oracle Jre 8 + gradle 5.2.1"

# Prepare
ENV JAVA_VERSION 8u201
ENV BUILD_VERSION b09
ENV MAGIC_NUM 42970487e3af4f5aa5bca3f542482c60

WORKDIR /tmp

# Oracle jre 8
RUN yum -y install wget; wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/$MAGIC_NUM/server-jre-$JAVA_VERSION-linux-x64.tar.gz" -O server-jre-8-linux-x64.tar.gz
RUN tar xzf server-jre-8-linux-x64.tar.gz; mkdir -p /usr/java; mv jdk1.8.0_201 /usr/java; ln -s /usr/java/jdk1.8.0_201 /usr/java/latest; ln -s /usr/java/latest /usr/java/default

RUN alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 1

ENV JAVA_HOME /usr/java/latest

RUN rm -f server-jre-8-linux-x64.tar.gz

# Gradle 5.2.1
WORKDIR /opt
RUN yum -y install unzip; wget https://services.gradle.org/distributions/gradle-5.2.1-bin.zip; unzip gradle-*.zip
ENV GRADLE_BIN /opt/gradle-5.2.1/bin
RUN chmod +x ${GRADLE_BIN}/gradle
ENV PATH $PATH:${GRADLE_BIN}


# clean
RUN rm -rf *.zip
RUN yum -y clean all




WORKDIR /tmp

# Install Mysql-client
RUN wget http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-community-client-5.7.24-1.el7.x86_64.rpm
RUN wget http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-community-libs-5.7.24-1.el7.x86_64.rpm
RUN wget http://mirrors.sohu.com/mysql/MySQL-5.7/mysql-community-common-5.7.24-1.el7.x86_64.rpm
RUN rpm -ivh mysql-community-common-5.7.24-1.el7.x86_64.rpm mysql-community-libs-5.7.24-1.el7.x86_64.rpm mysql-community-client-5.7.24-1.el7.x86_64.rpm

# From: https://blog.csdn.net/gdsgdh308227363/article/details/79683058


RUN yum -y install git
RUN git clone https://github.com/FISCO-BCOS/fisco-bcos-browser.git /fisco-bcos-browser
WORKDIR /fisco-bcos-browser
RUN git checkout dev2.0.0


WORKDIR  /fisco-bcos-browser/server/fisco-bcos-browser
RUN gradle build


WORKDIR  /fisco-bcos-browser/server/fisco-bcos-browser/dist/conf
# 修改当前服务端口：
#RUN sed -i "s/8088/${your_server_port}/g" application.yml
# 修改数据库IP：
RUN sed -i "s/127.0.0.1/${db}/g" application.yml
# 修改数据库名称：
#RUN sed -i "s/testDB/${your_db_name}/g" application.yml
# 修改数据库用户名：
RUN sed -i "s/root/${test}/g" application.yml
# 修改数据库密码：
RUN sed -i "s/123456/${test123}/g" application.yml

WORKDIR  /fisco-bcos-browser/server/fisco-bcos-browser/dist/
RUN chmod +x *.sh
RUN sh start.sh

# CMD [ "/bin/bash" ]
CMD [ "tail", "-f", "log/fisco-bcos-browser.log" ]