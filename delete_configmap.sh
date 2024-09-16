#!/bin/bash

set -e
set -o pipefail

kubectl delete configmap auth-k8s-env
kubectl delete configmap payment-k8s-env
kubectl delete configmap api-wilayah-k8s-env
kubectl delete configmap api-manager-k8s-env