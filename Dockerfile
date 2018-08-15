FROM jenkins:latest

EXPOSE 8080

CMD ["/var/jenkins_home/secrets/initialAdminPassword"]

