#!/usr/bin/env bash

minikube addons enable ingress

#ingress for jfrog
kubectl create -f ../k8-definition/ingress/minikube-jfrog.yaml

#ingress for jenkins
#css doesn't work with ingress
#kubectl create -f ../k8-definition/ingress/minikube-jenkins.yaml