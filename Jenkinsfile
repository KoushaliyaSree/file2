pipeline{

	agent any

	    environment {
        DOCKER_CREDENTIALS_ID = 'docker hub'
        DOCKER_IMAGE_NAME = 'koushaliya/file22'
        PATH = "/opt/sonar-scanner/bin:$PATH"
        SONAR_TOKEN = credentials('SonarProject')
        NGINX_HTML_DIR = "/usr/share/nginx/html"
        BUILD_DIR = "build" 
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
                withSonarQubeEnv('sonar') {
                    // Run SonarQube Scanner
                    sh 'sonar-scanner \
                        -Dsonar.projectKey=SonarProject \
                        -Dsonar.sources=src/main.jsx \
                        -Dsonar.host.url=http://localhost:9000 \
                        -Dsonar.login=sqp_e784bbff0175ae1c168ce07ef2e7ee039d2c497f'
                }
            }
        }//hello11


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


        stage('Trigger CD pipeline') {
            steps {
                script {
                   build job:"CDfile2" , wait:true
                }
            }//hello
		}
  


	}
}