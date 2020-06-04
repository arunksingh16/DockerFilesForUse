# Dockerfile to use in case you are using Artifactory as a proxy
# settings.xml is a custom file generated from artifactiry
####################################################################

FROM artifactory.xcompany.com/docker/maven:3.6.3-jdk-8 AS build
ARG MAVEN_VERSION="3.6.3"
COPY src /usr/src/myapp/src
COPY settings.xml /root/.m2/settings.xml
COPY pom.xml /usr/src/myapp
RUN mvn -f /usr/src/myapp/pom.xml clean package
FROM artifactory.xcompany.com/docker/java:8
COPY --from=build /usr/src/myapp/target/HelloWorld-1.0.0.jar /usr/local/lib/HelloWorld-1.0.0.jar
WORKDIR /usr/local/lib/
EXPOSE 8080
ENTRYPOINT ["java","-jar","HelloWorld-1.0.0.jar"]
