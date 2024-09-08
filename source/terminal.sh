#!/bin/bash

set -e


echo "터미널 세팅"
mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/
sudo chown $(id -u):$(id -g) $HOME/admin.conf
sudo echo "export KUBECONFIG=$HOME/admin.conf" >> ~/.bashrc

echo "Done 터미널 세팅"