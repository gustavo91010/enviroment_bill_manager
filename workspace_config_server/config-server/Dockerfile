# Usando uma imagem base com JDK 17
FROM openjdk:17-jdk-slim

# Defina o diretório de trabalho
WORKDIR /app

# Copie o arquivo .jar para o container
# COPY target/config-server.jar /app/config-server.jar
COPY target/config-server-0.0.1-SNAPSHOT.jar /app/config-server.jar

# Exponha a porta em que o app irá rodar
EXPOSE 8888

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "/target/config-server.jar"]

