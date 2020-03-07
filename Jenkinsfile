pipeline {
    agent {
        kubernetes {
          label 'pipeline-pods'
          defaultContainer 'jnlp'
          yamlFile './jenkins/jenkinsPipelinePods.yaml'
        }
    }
    stages {
        stage('Build') {
            steps {
                container('maven') {
                    sh 'echo "starting maven!"'
                    sh 'DOCKER_HOST=tcp://localhost:2375 mvn -B -DskipTests clean deploy'
                    sh 'echo "maven over!"'
                }
            }
        }
        stage('Deliver') {
            steps {
                container('jnlp') {
                    sh './jenkins/scripts/deliver.sh'
                }
            }
        }
    }
}