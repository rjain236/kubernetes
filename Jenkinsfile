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
                    sh 'mvn -B -DskipTests clean package'
                }
            }
        }
        stage('Deliver') {
            steps {
                sh './jenkins/scripts/deliver.sh'
            }
        }
    }
}