#!/bin/bash

set -o errexit
set -o nounset

HOME=${PWD}
CLUSTER=test02
CONFIGFILE=./k3d-config.yaml

k3d cluster create ${CLUSTER} --config ${CONFIGFILE}
export KUBECONFIG=$(k3d kubeconfig write ${CLUSTER})

kubectl apply -f init/namespaces/

# Add web stuff
echo "Adding leffen web service"
kubectl apply -f manifests/leffen-web -n leffen-web




