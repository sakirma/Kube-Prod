#!/bin/sh

# Installing Istio Ambient which is alpha. This is not advisable to use for production since it is still in alpha stage.
# However, this will be used for this project since it prevents me to deploy istio side cars which saves resources on my local machine.

kubectl create namespace istio-system

kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd/experimental?ref=444631bfe06f3bcca5d0eadf1857eac1d369421d" | kubectl apply -f -; }

istioctl install --set profile=ambient --skip-confirmation
