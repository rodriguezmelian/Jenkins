pipeline {
    agent any
    stages {
        stage('Example') {
            docker {'docker ls'}
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
    }
}
