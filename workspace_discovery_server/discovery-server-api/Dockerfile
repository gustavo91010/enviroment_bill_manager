# Construir o projeto
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Rodar o projeto
FROM openjdk:17-jdk
WORKDIR /app
COPY --from=build /app/target/discovery-server-api-0.0.1-SNAPSHOT.jar /app/discovery-server-api.jar
CMD ["java", "-jar", "discovery-server-api.jar"]


# # Use uma imagem base com o JDK
# FROM openjdk:11-jre-slim

# # Defina o diretório de trabalho
# WORKDIR /app

# # Copie o JAR da aplicação para o container
# COPY target/discovery-server-api.jar discovery-server-api.jar

# # Exponha a porta do Eureka
# EXPOSE 8761

# # Comando para rodar a aplicação
# ENTRYPOINT ["java", "-jar", "discovery-server-api.jar"]

