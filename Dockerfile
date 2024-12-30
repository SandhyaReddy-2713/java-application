#multi-stage to access java-application
# FROM maven AS build
# WORKDIR /app
# COPY . /app
# RUN mvn clean install

# FROM openjdk:17-alpine
# WORKDIR /test
# COPY --from=build /app/target/*.war /test
# CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
# #ENTRYPOINT ["java", "-jar", "app-0.0.1-SNAPSHOT.war" --server.port=8081]
# EXPOSE 8080
# #CMD ["sleep", "infinity"] #to make the container not to be in exited state





# # For normally accessing java-application
# FROM ubuntu
# RUN apt-get update && apt-get install -y \
#     openjdk-17-jdk \
#     maven \
#     git
# WORKDIR /test
# RUN git clone https://github.com/SandhyaReddy-2713/java-application.git /test \
#     && mvn clean install
# RUN cp /test/target/*.war /test/app.war
# EXPOSE 8080
# CMD ["java", "-jar", "app.war"]



# dockerfile using sh 
# FROM ubuntu
# RUN apt update && apt install openjdk-17-jdk maven git  -y
# WORKDIR /test
# RUN git clone https://github.com/SandhyaReddy-2713/java-application.git /test
# RUN mvn clean install
# ENTRYPOINT ["build.sh"]
# EXPOSE 8080




# dockerfile for manual proces:
FROM openjdk:17-jdk-alpine
WORKDIR /test
COPY /target/app-0.0.1-SNAPSHOT.war /test
CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war"]
#CMD ["sleep", "infinity]
EXPOSE 8080
