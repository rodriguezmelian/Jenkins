pipeline {
    agent any
    stages {
        stage('Example') {
            steps {
                sh 'docker ls'
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}
