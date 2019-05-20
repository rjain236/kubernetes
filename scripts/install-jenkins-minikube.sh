#!/usr/bin/env bash

kubectl create -f ../k8-definition/jenkins/minikube/namespace.yaml
kubectl create -f ../k8-definition/jenkins/minikube/volume.yaml

HELM_VERSION=2.13.1

helm init
helm update


# Give tiller a chance to start up
until helm version; do sleep 10;done

#install jenkins using helm
helm install --name jenkins -f ../k8-definition/jenkins/minikube/values.yaml stable/jenkins --namespace jenkins-project

#print password to connect to jenkins
printf $(kubectl get secret --namespace jenkins-project jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo

#give cluster permission to default namespace
kubectl apply -f ../k8-definition/clusterrolebinding/defaultUserBinding.yaml