pipeline {
    agent any
 
    stages {

        stage ('Git Cloning') {
            steps {
                git 'https://github.com/yourusername/your-java-app.git'
            }
        }
        
        stage ('Docker login & Building image') {
            steps {
                sh ' docker login -u $DOCKER_USER -p $DOCKER_PASS '
                sh 'docker build -t ravivarman46/javaapp:v1'
            }
        }

        stage ('Pushing the Docker image to DockerHub') {
            steps {
                sh 'docker push ravivarman46/javaapp:v1'
            }
        }
        
        stage('Deploy to Deployment server') {
            steps {
                script {
                    sshagent(['ssh']) {
                        // Execute the command within the sshagent block using sh step
                        sh 'ssh -o StrictHostKeyChecking=no ubuntu@18.222.168.185 "docker run -d -it --name javaapp -p 80:8080 ravivarman46/javaapp:v1"'
                    }
                }
            }
        }
    }
}

