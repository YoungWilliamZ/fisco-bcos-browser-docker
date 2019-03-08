FROM centos:7

MAINTAINER YoungWilliam <youngwilliam.zheng@gmail.com>
LABEL Version="0.1"
LABEL Name="fisco-bcos-browser"
LABEL Description="Apache Tomcat Container 9 + Oracle Jre 8 + gradle 5.2.1"

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


# Install Tomcat
ENV TOMCAT_MAJOR 9
ENV TOMCAT_VERSION 9.0.16
ENV CATALINA_HOME /opt/tomcat

RUN mkdir -p ${CATALINA_HOME}

WORKDIR ${CATALINA_HOME}

RUN wget https://mirrors.aliyun.com/apache/tomcat/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
 tar -xvf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
 rm apache-tomcat*.tar.gz && \
 mv apache-tomcat*/* ${CATALINA_HOME}

RUN chmod +x ${CATALINA_HOME}/bin/*sh

# Create Tomcat admin user
ADD create_admin_user.sh $CATALINA_HOME/scripts/create_admin_user.sh
ADD tomcat.sh $CATALINA_HOME/scripts/tomcat.sh
RUN chmod +x $CATALINA_HOME/scripts/*.sh

# Create tomcat user
RUN groupadd -r tomcat && \
 useradd -g tomcat -d ${CATALINA_HOME} -s /sbin/nologin  -c "Tomcat user" tomcat && \
 chown -R tomcat:tomcat ${CATALINA_HOME}



EXPOSE 8080
EXPOSE 8009

USER tomcat
CMD ["tomcat.sh"]



WORKDIR /

CMD ["/bin/bash", "--login"]
