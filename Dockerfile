#BUILD
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package


# CREATE IMAGE
FROM bitnami/wildfly:32.0.0

RUN /opt/bitnami/wildfly/bin/add-user.sh admin admin --silent

COPY --from=build /app/target/core-ee.war app/core-ee.war

EXPOSE 8080 9990 9993

CMD ["/opt/bitnami/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
