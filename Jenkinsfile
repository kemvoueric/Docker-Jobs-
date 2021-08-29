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

        stage('build docker images') {
            steps {
             sh 'sudo docker build -t linux2021/geradine1:${BUILD_NUMBER} .'
             sh 'sudo docker login -u linux2021 -p Police1998'


            }

        }
    







}
 
