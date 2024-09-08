#!/bin/bash

set -e


echo "Enable CRI plugin in containerd"
sudo sed -i '/disabled_plugins = \["cri"\]/d' /etc/containerd/config.toml
sudo systemctl restart containerd

echo "Done Enable CRI plugin in containerd"


