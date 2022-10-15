#!/bin/bash

set -o errexit
set -o nounset

HOME=${PWD}
CLUSTER=test02
CONFIGFILE=./k3d-config.yaml

k3d cluster create ${CLUSTER} --config ${CONFIGFILE}
export KUBECONFIG=$(k3d kubeconfig write ${CLUSTER})

kubectl apply --context k3d-test02 -f init/namespaces/
kubectl apply --context k3d-test02 -f manifests/
