#!/bin/sh

# https://istio.io/latest/docs/setup/platform-setup/kind/
# https://kind.sigs.k8s.io/docs/user/loadbalancer/


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml

kubectl wait --namespace metallb-system \
                --for=condition=ready pod \
                --selector=app=metallb \
                --timeout=90s
