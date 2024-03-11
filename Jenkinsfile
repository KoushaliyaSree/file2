pipeline{

	agent any

	    environment {
        DOCKER_CREDENTIALS_ID = 'docker hub'
        DOCKER_IMAGE_NAME = 'koushaliya/file22'
    }

	stages {
	    
	    stage('gitclone') {

			steps {
				 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KoushaliyaSree/file2.git']])
			}
		}

		stage('Build Docker Image') {
            steps {
                script {
                    // Define the Dockerfile location and image tag
                    def dockerfile = '/home/dell/file2/Dockerfile'c
                    def imageName = 'koushaliya/22:latest'

                    // Build the Docker image
                    docker.build(imageName, "-f ${dockerfile} .")
                }
            }
        }
       



	}

	

}