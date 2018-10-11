node {
    DOCKER_HOME = tool "docker"
    sh """
        echo $DOCKER_HOME
        ls $DOCKER_HOME/bin/
        $DOCKER_HOME/bin/docker images
        $DOCKER_HOME/bin/docker ps -a
    """
}
