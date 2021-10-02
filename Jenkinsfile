pipeline {
    agent any
     parameters {


           choice(name: 'team', choices: ['devops', 'developer', 'tester'], description: 'Select your team')
           string(defaultValue: "", description: 'Enter your last_name', name: 'name')
           choice(name: 'app', choices: ['client', 'api', 'db'], description: 'Select an app')
           choice(name: 'registry', choices: ['nexus', 'dockerhub', 'both'], description: 'Select a registry')
           string(defaultValue: "", description: 'supply a github repository', name: 'github')
           string(defaultValue: "", description: 'supply the branch for the docker image', name: 'branch')
           choice(name: 'repository', choices: ['klm', 'jnlp'], description: 'Select a repository')
           string(defaultValue: "", description: 'supply a tag ', name: 'tag')
           
    }

    stages {
        stage('clone') {
            steps {
                sh '''
                rm -rf ./*
                git clone -b $branch  $github
               
                '''
            }
        }


        stage('validate dockerfile') {
            steps {
                sh '''
                A=$(ls)
               cat $A/Dockerfile
                '''
            }
        }

         stage('Build') {
            steps {
                sh '''
                A=$(ls)
               cat $A/Dockerfile
                cd $A
               sudo  docker rmi -f ${team}_${name}_${app}_${repository}:${tag} || true 
               sudo docker build -t ${team}_${name}_${app}_${repository}:${tag} .
               echo $team
               echo $name
              echo  $app
              echo  $repository
              echo $tag

                '''
            }
        }



    stage('push') {
            steps {
                sh '''
              

                '''
            }
        }
    

    
         stage ('dockerhub') {
            when {
              
                expression { params.registry == 'dockerhub' }
            }
            steps {
                sh '''
                 echo dockerhub
                '''
            }
        }

           

            stage ('nexus') {
            when {
               
                expression { params.registry == 'nexus' }
            }
            steps {
                sh '''
                  sudo docker login 34.213.92.53:5000 -u admin -p abc123
                  sudo docker tag ${team}_${name}_${app}_${repository}:${tag}  34.213.92.53:5000/${team}_${name}_${app}_${repository}:${tag}
                  sudo docker push 34.213.92.53:5000/${team}_${name}_${app}_${repository}:${tag}
                '''
            }
        }

          stage ('both') {
            when {
                
                expression { params.registry == 'both' }
            }
            steps {
                sh '''
                echo both
                '''
            }
        }

    }





}

