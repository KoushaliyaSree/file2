pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('koushaliya-docker')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				 git 'https://github.com/KoushaliyaSree/file2.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t koushaliya/file2 .'
			}
		}

	
	}

	

}