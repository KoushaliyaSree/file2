pipeline{

	agent any

	    environment {
        DOCKER_CREDENTIALS_ID = 'docker hub'
        DOCKER_IMAGE_NAME = 'koushaliya/file22'
        SONAR_TOKEN = credentials('DemoSonarProject')
    }

	stages {
	    
	    stage('gitclone') {

			steps {
				 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KoushaliyaSree/file2.git']])
			}
		}

            stage('SonarQube analysis') {
            steps {
                // Inject SonarQube environment variables
                withSonarQubeEnv('SonarQube') {
                    // Run SonarQube Scanner
                    sh 'sonar-scanner \
                        -Dsonar.projectKey=DemoSonarProject \
                        -Dsonar.sources=/home/dell/file2/src \
                        -Dsonar.host.url=http://172.17.0.1:9000 \
                        -Dsonar.login=DemoSonarProject'
                }
            }
        }


		stage('Build Docker Image') {
            steps {
                script {
                    // Define the Dockerfile location and image tag
                    def dockerfile = '/var/lib/jenkins/workspace/file2job/Dockerfile'
                    def imageName = 'koushaliya/file22:latest'

                    // Build the Docker image
                    docker.build(imageName, "-f ${dockerfile} .")
                }
            }
        }

		stage('Push Docker Image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
					sh 'docker login -u koushaliya -p ${dockerhubpwd} '
					}

					sh 'docker push koushaliya/file22'
                    
                }
            }//hello
    
		}

       


	}
}