#!/bin/bash

set -e
set -o pipefail

echo "Starting deployment...."

kubectl apply -f k8s/components.yaml
kubectl apply -f k8s/ingress-controller.yaml
kubectl apply -f k8s/postgres
kubectl apply -f k8s/auth
kubectl apply -f k8s/api_key_management
kubectl apply -f k8s/payment_service
kubectl apply -f k8s/api_wilayah
kubectl apply -f k8s/frontend

echo "All Component Has Been Created"