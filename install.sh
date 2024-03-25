#!/bin/sh

kind create cluster --config ./values.yaml


./scripts/cilium.sh
(cd ./scripts/metallb && ./metalLB.sh)

(cd ./scripts/istio && ./istio.sh)


echo 'Installing podinfo-istio helm chart'
kubectl create namespace podinfo-test
kubectl label namespace podinfo-test istio.io/dataplane-mode=ambient
helm upgrade --install podinfo ./charts/podinfo-istio -n podinfo-test --create-namespace
