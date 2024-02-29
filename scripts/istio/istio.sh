#!/bin/sh

# helm repo add istio https://istio-release.storage.googleapis.com/charts
# helm repo update

# kubectl create namespace istio-system

# helm upgrade --install istio-base istio/base -n istio-system \
#     --set defaultRevision=default

# helm upgrade --install istiod istio/istiod --wait -n istio-system \
#     --set defaults.istio_cni.enabled=true

# TODO: check how the operator install istio and do the same with the helm chart.
istioctl install -f ./istio-cni.yaml
