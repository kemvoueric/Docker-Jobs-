pipeline {
    agent any

    stages {
        stage('cleaning environment') {
            steps {
                A=$(sudo docker images -aq)
                sudo docker rm -f $(sudo docker ps -aq)
                sudo docker rmi -f $A || true 

            }
        }
    }
}








    
}
