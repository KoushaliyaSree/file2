pipeline{

	agent any

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker hub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				 checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/KoushaliyaSree/file2.git']])
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t koushaliya/file22 .'
			}
		}

	
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}