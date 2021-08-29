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
    



        stage('pushing images to Dockerhub') {
            steps {
             sh 'sudo docker push linux2021/geradine1:${BUILD_NUMBER}'
            }
        }


        stage('pushing images to Nexus') {
            steps {
            sh 'sudo docker tag linux2021/geradine1:${BUILD_NUMBER}  54.185.222.32:8085/linux2021/geradine1:${BUILD_NUMBER}'
            sh 'sudo docker login 54.185.222.32:8085  -u admin -p abc123'
             sh 'sudo docker push 54.185.222.32:8085/linux2021/geradine1:${BUILD_NUMBER}'
            }
        }


    stage('running container') {
            steps {
             sh 'sudo docker run -itd  -p 4500:80 --name eric linux2021/geradine1:${BUILD_NUMBER}'
            }
        }



}
 


post {


    failure {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' ")

      hipchatSend (color: 'RED', notify: true,
          message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' )"
        )


    }
   
    
    
   success {
      slackSend (color: '#FF0000', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' ")

      hipchatSend (color: 'RED', notify: true,
          message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' )"
        )


    }
 
    }
  }


