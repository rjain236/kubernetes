#!/usr/bin/env bash

kubectl create -f ../k8-definition/jfrog/namespace.yaml

HELM_VERSION=2.13.1

helm init
helm update


# Give tiller a chance to start up
until helm version; do sleep 10;done


helm repo add jfrog https://charts.jfrog.io


helm install --name artifactory \
               --namespace jfrog-project \
               --set postgresql.enabled=false \
               --set artifactory.resources.requests.cpu="500m" \
               --set artifactory.resources.limits.cpu="2" \
               --set artifactory.resources.requests.memory="1Gi" \
               --set artifactory.resources.limits.memory="4Gi" \
               --set artifactory.javaOpts.xms="1g" \
               --set artifactory.javaOpts.xmx="4g" \
               --set nginx.resources.requests.cpu="100m" \
               --set nginx.resources.limits.cpu="250m" \
               --set nginx.resources.requests.memory="250Mi" \
               --set nginx.resources.limits.memory="500Mi" \
               --set artifactory.image.repository=docker.bintray.io/jfrog/artifactory-oss \
               jfrog/artifactory

#expose the ngix as a service for ingress
kubectl apply -f ../k8-definition/jfrog/expose-ngix.yaml
