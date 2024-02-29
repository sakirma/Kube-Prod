#!/bin/sh

kubectl create namespace test


helm repo add podinfo https://stefanprodan.github.io/podinfo

helm upgrade --install --wait frontend \
--namespace test \
--set replicaCount=2 \
--set backend=http://backend-podinfo:9898/echo \
podinfo/podinfo

helm upgrade --install --wait backend \
--namespace test \
--set redis.enabled=true \
podinfo/podinfo
