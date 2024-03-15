#!/bin/sh

kind create cluster --config ./values.yaml


./scripts/cilium.sh
(cd ./scripts/metallb && ./metalLB.sh)


kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd/experimental?ref=444631bfe06f3bcca5d0eadf1857eac1d369421d" | kubectl apply -f -; }

(cd ./scripts/istio && ./istio.sh)



echo 'Installing podinfo-istio helm chart'
kubectl create namespace podinfo-test
kubectl label namespace podinfo-test istio-injection=enabled
helm upgrade --install podinfo-istio ./charts/podinfo-istio -n podinfo-test --create-namespace
