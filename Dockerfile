FROM ubuntu:latest
WORKDIR /
ADD target/*.jar /project.jar
EXPOSE 8080
CMD java -jar /project.jar