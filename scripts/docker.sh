#!/bin/bash

set -e

echo "Install Docker"
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo "done Install Docker"