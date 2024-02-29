#!/bin/sh

helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

kubectl create namespace istio-system

echo 'Installing istio cni'
helm upgrade --install istio-cni istio/cni -n istio-system --wait

echo 'Installing istio-base'
helm upgrade --install istio-base istio/base -n istio-system \
    --set defaultRevision=default

echo 'Installing istiod'
helm upgrade --install istiod istio/istiod --wait -n istio-system \
    --set istio_cni.enabled=true \
    --set istio_cni.chained=true
