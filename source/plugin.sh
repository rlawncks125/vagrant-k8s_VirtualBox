#!/bin/bash

set -e

echo "Install plugin calico"

curl https://raw.githubusercontent.com/projectcalico/calico/v3.28.1/manifests/calico.yaml -O
kubectl apply -f calico.yaml

echo "Done Install plugin calico"

