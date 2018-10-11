pipeline {
    agent any
	stages {
		
	stage('Run Image')
		{
			steps{
				//antes del run verifico si no existe el container 
				script{
						CONTAINER_ID = sh (
							script: 'docker ps -aqf "name=app-running"',
							returnStdout: true
						).trim()
						
						if ( CONTAINER_ID ) {
							sh 'docker stop app-running'
							echo 'Stoppeo la instancia'
							sh 'docker rm app-running'
						}
					}	
					
				sh "docker run -e LICENSE=accept -d -p ${properties.'API.manageport'}:7600 -p ${properties.'API.port'}:7800 -P --name app-running image-temp"
			}
		}

        }
