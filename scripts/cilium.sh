#!/bin/sh

echo 'Installing Cilium'

helm upgrade --install cilium cilium/cilium --wait --version 1.15.1 \
   --namespace kube-system \
   --set image.pullPolicy=IfNotPresent \
   --set ipam.mode=kubernetes \
   --set socketLB.hostNamespaceOnly=true \
   --set socketLB.enabled=true \
   --set cni.exclusive=false
