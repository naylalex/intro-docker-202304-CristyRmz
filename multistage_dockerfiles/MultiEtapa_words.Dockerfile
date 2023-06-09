FROM maven:3.6.3-jdk-8-slim AS etapa1
COPY pom.xml .
COPY src src
RUN mvn verify 

FROM openjdk:8-jre-slim
COPY --from=etapa1 ./target ./target
CMD ["java", "-Xmx8m", "-Xms8m", "-jar", "/target/words.jar"]
EXPOSE 8080