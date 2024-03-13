pipeline{

	agent any

	    environment {
        DOCKER_CREDENTIALS_ID = 'docker hub'
        DOCKER_IMAGE_NAME = 'koushaliya/file22'
        SONAR_TOKEN = credentials('filetoken')
    }

	stages {
	    
	    stage('gitclone') {

			steps {
				 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KoushaliyaSree/file2.git']])
			}
		}

           stage('SonarQube analysis') {
            steps {
                script {
                    def scannerHome = tool 'SonarQube Scanner'
                    withSonarQubeEnv('SonarQube') {
                        sh "${scannerHome}/bin/sonar-scanner \
                            -Dsonar.projectKey=fileappproject \
                            -Dsonar.sources=/KoushaliyaSree/file2 \
                            -Dsonar.host.url=http://172.17.0.1:9000 \
                            -Dsonar.login=${env.SONAR_TOKEN}"
                    }
                }
            }//hello
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