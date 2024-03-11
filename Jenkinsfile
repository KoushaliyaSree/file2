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

       



	}

	

}