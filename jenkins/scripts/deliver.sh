#!/usr/bin/env bash
#need to be run as default user to grant this service account the cluster admin permission
kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:jenkins-project:default
echo "delivery is completed!"
