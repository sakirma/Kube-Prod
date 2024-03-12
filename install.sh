#!/bin/sh

kind create cluster --config ./values.yaml

./scripts/cilium.sh
(cd ./scripts/metallb && ./metalLB.sh)
(cd ./scripts/istio && ./istio.sh)



echo 'Installing podinfo-istio helm chart'
helm upgrade --install podinfo-istio ./charts/podinfo-istio -n podinfo-test --create-namespace

kubectl label namespace podinfo-test istio-injection=enabled