#!/bin/bash

set -e
set -o pipefail

kubectl create configmap auth-k8s-env --from-env-file=.env.auth.docker
kubectl create configmap payment-k8s-env --from-env-file=.env.payment-service.docker
kubectl create configmap api-wilayah-k8s-env --from-env-file=.env.api-wilayah.docker
kubectl create configmap api-manager-k8s-env --from-env-file=.env.api-key-management.docker