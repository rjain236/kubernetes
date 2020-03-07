//def  imageTag = "gcr.io/${project}/${appName}:${env.BRANCH_NAME}.${env.BUILD_NUMBER}"
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
        stage('Deploy Production') {
          steps{
            container('kubectl') {
            // Change deployed image in canary to the one we just built
            // #sh("sed -i.bak 's#gcr.io/cloud-solutions-images/gceme:1.0.0#${imageTag}#' ./k8s/production/*.yaml")
              sh("kubectl --namespace=dev apply -f k8-definition/deployments/")
              sh("kubectl --namespace=dev apply -f k8-definition/services/")
            //  sh("echo http://`kubectl --namespace=production get service/${feSvcName} -o jsonpath='{.status.loadBalancer.ingress[0].ip}'` > ${feSvcName}")
            }
          }
        }
    }
}