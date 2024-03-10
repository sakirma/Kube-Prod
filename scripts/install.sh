#!/bin/sh

kind create cluster --config ./values.yaml

./cilium.sh


# ./istio/istio.sh

# ./test_podinfo.sh
