#!/bin/bash
pipeline

{
    agent any
    stages{
        
            stage('Compilacion')
		{
			agent {
				docker { image 'ibmcom/ace:latest' 
						args '-e LICENSE=accept -v /var/lib/jenkins/workspace/${JOB_NAME}:/opt/workspace'
				}
			}
			steps{
			        
			       
					echo "EJECUTO"
				}
					
		}
    }
}
