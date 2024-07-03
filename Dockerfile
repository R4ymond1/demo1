# 基础镜像
FROM openjdk:17-jdk-slim

# 作者信息
MAINTAINER "raymond"

# 添加一个存储空间
VOLUME /tmp

# 暴露8080端口
EXPOSE 8090

# 添加变量，如果使用dockerfile-maven-plugin，则会自动替换这里的变量内容
ARG JAR_FILE=target/demo1-0.0.1-SNAPSHOT.jar

# 往容器中添加jar包
ADD ${JAR_FILE} demon1.jar

# 启动镜像自动运行程序
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/urandom","-jar","/demon1.jar"]