#!/bin/bash

set -e
set -o pipefail

echo "Shutting down..."

kubectl delete -f k8s/components.yaml
kubectl delete -f k8s/ingress-controller.yaml
kubectl delete -f k8s/postgres
kubectl delete -f k8s/auth
kubectl delete -f k8s/api_key_management
kubectl delete -f k8s/payment_service
kubectl delete -f k8s/api_wilayah
kubectl delete -f k8s/ingress.yaml

echo "All Component Has Been Shutdown"