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


#to access application on tomcat
FROM maven as build
WORKDIR /app
COPY . /app
RUN mvn clean install -DskipTests

FROM openjdk:17-alpine
COPY --from=build /app/target/bankapp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["java", "-jar", "app-0.0.1-SNAPSHOT.war]
RUN ["catalina.sh", "run"]
