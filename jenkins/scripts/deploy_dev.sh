#!/usr/bin/env bash
echo "Starting deployment"
kubectl delete ns dev  --grace-period=0 && sleep 0 || true
kubectl create ns dev
kubectl --namespace=dev apply -f k8-definition/deployments/
kubectl --namespace=dev apply -f k8-definition/services/


