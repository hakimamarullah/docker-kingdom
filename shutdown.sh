#!/bin/bash

set -e
set -o pipefail

echo "Shutting down..."

kubectl delete -f k8s/components.yaml
kubectl delete -f k8s/ingress-controller.yaml
kubectl delete -f k8s/postgres/postgres-service.yaml
kubectl delete -f k8s/postgres/postgres-set.yaml
kubectl delete -f k8s/auth
kubectl delete -f k8s/api_key_management
kubectl delete -f k8s/payment_service
kubectl delete -f k8s/api_wilayah
kubectl delete -f k8s/ingress.yaml
kubectl delete -f k8s/github-secret.yaml
kubectl delete -f k8s/starline_scc
kubectl delete -f k8s/mailer

echo "All Component Has Been Shutdown"