pipeline {
    agent { 
            docker {'docker ls'}
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
}
