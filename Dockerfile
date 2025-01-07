#multi-stage to access java-application
# FROM maven AS build
# WORKDIR /app
# RUN git clone https://github.com/SandhyaReddy-2713/java-application.git /app
# RUN mvn clean install

# FROM openjdk:17-alpine
# WORKDIR /test
# COPY --from=build /app/target/*.war /test
# CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
# EXPOSE 8080
