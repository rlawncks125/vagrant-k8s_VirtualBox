#!/bin/bash

set -e

echo "Disable swap"
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo swapoff -a

echo "Done Disable swap"