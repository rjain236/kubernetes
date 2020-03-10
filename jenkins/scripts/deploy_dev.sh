#!/usr/bin/env bash
echo "Starting deployment"
kubectl get serviceaccounts
#need to be run as default user to grant this service account the cluster admin permission
#kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:jenkins-project:default
kubectl delete ns dev  --grace-period=0 && sleep 0 || true
kubectl create ns dev
kubectl --namespace=dev apply -f k8-definition/deployments/
kubectl --namespace=dev apply -f k8-definition/services/


