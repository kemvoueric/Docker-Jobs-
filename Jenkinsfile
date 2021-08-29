pipeline {
    agent any

    stages {
        stage('cleaning environment') {
            steps {
             sh   'A=$(sudo docker images -aq)'
             sh  'sudo docker rm -f $(sudo docker ps -aq) || true'
             sh  'sudo docker rmi -f $A || true' 

            }
        }
    }







}
