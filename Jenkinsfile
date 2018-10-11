pipeline {
    agent none
        stage('Build Image')
		{
			steps{
				echo "Cargo propiedades"
				script{
					loadProperties(params.environment)
					workspacesdir = workspacesdir + "${JOB_NAME}"
				}
				
				echo "${workspacesdir}"
				echo "Realizo replace en odbc.ini"
					
				sh "cat ${workspacesdir}/${params.appname}/connections/odbc.ini | \
					sed -e 's,#SQLLOCAL.port#,${properties.'SQLLOCAL.port'},' \
						-e 's,#SQLLOCAL.database#,${properties.'SQLLOCAL.database'},' \
						-e 's,#SQLLOCAL.hostname#,${properties.'SQLLOCAL.hostname'},' \
						-e 's,#SQLLOCAL.installdir#,${mqsihome},' \
					> /tmp/odbc.ini"
				
				sh "cp /tmp/odbc.ini ${workspacesdir}"
				
				echo "Hago el build"
				sh "docker build -t image-temp --build-arg dbname=${properties.'SQLLOCAL.dbname'} --build-arg dbuser=${properties.'SQLLOCAL.dbuser'} --build-arg dbpass=${properties.'SQLLOCAL.dbpass'} ."
				
				//borro odbc.ini del workspace y del tmp
				sh "rm /tmp/odbc.ini"
				sh "rm ${workspacesdir}/odbc.ini"
			}
		}
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
    }
}
