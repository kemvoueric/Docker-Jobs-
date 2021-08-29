pipeline {
    agent any

    stages {
        stage('cleaning environment') {
            steps {
             
             sh  sudo docker rm -f $(sudo docker ps -aq)
             sh  sudo docker rmi -f $A || true 

            }
        }
    }
}

