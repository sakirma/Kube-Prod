#!/bin/sh

echo 'Installing istio cni'

helm upgrade --install istio-cni istio/cni -n kube-system --wait
