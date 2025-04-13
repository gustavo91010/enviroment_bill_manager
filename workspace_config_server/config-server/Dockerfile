# Construir o projeto
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Rodar o projeto
FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /app/target/config-server-0.0.1-SNAPSHOT.jar /app/config-server.jar
CMD ["java", "-jar", "config-server.jar"]

