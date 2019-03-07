
    
FROM centos:7

MAINTAINER YoungWilliam <youngwilliam.zheng@gmail.com>

ENV JAVA_VERSION 8u201
ENV BUILD_VERSION b09

WORKDIR /tmp

RUN yum -y install wget; wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/server-jre-$JAVA_VERSION-linux-x64.tar.gz" -O server-jre-8-linux-x64.tar.gz
RUN tar xzf server-jre-8-linux-x64.tar.gz; mkdir -p /usr/java; mv jdk1.8.0_201 /usr/java; ln -s /usr/java/jdk1.8.0_201 /usr/java/latest; ln -s /usr/java/latest /usr/java/default

RUN alternatives --install /usr/bin/java java /usr/java/latest/bin/java 1
RUN alternatives --install /usr/bin/javac javac /usr/java/latest/bin/javac 1

ENV JAVA_HOME /usr/java/latest

RUN rm -f server-jre-8-linux-x64.tar.gz; yum -y remove wget; yum -y clean all
WORKDIR /


