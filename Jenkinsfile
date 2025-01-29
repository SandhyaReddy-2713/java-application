# to access the application or to run application on tomcat server and integrated with docker container, jenkins, mysql database.
pipeline {
    agent any
    stages {
        stage ("git scm") {
            steps {
                git branch: 'main', url: 'https://github.com/SandhyaReddy-2713/java-application.git'
            }
        }
        stage ("compile") {
            steps {
                sh 'mvn compile'
            }
        }
        stage ("delete networks, images and container") {
            steps {
                sh 'docker stop $(docker ps -q) || true'
                sh 'docker rm $(docker ps -aq) || true'
                sh 'docker rmi $(docker images -q) || true'
                sh 'docker network rm banking-network || true'
            }
        }
        stage ("create a docker network") {
            steps {
                sh 'docker network create banking-network'
            }
        }
        stage ("run sql database") {
            steps {
                sh 'docker run -d --name mysql --network banking-network -e MYSQL_ROOT_PASSWORD=Test@123 -e MYSQL_DATABASE=bankappdb -p 3306:3306 mysql'
            }
        }
        stage ("create docker image and container") {
            steps {
                sh 'docker build -t docker-imagess .'
                sh 'docker run -itd --name docker-containers --network banking-network -p 8085:8081 docker-imagess'
            }
        }
    }
}
