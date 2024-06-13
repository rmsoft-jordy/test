# 기본 이미지로부터 시작
FROM ubuntu:18.04

# nano 및 vim 설치
RUN \
    apt-get update && \
    apt-get install -y nano && \
    apt-get install -y vim

# 시스템 업데이트 및 업그레이드
RUN apt-get -y update && apt-get -y upgrade

# OpenJDK 8 및 wget 설치
RUN apt-get -y install openjdk-8-jdk wget

# Tomcat을 설치하고 디렉토리 설정
RUN mkdir /usr/local/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.84/bin/apache-tomcat-9.0.84.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.84/* /usr/local/tomcat/

# 임시 디렉토리 및 웹 애플리케이션 삭제
RUN rm -rf /tmp/* && rm -rf /usr/local/tomcat/webapps/*

# 컨테이너가 외부로 노출할 포트 설정
EXPOSE 8080

# Tomcat 실행 명령 설정
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]