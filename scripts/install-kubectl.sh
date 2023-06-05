#!/bin/sh

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

chmod +x kubectl

mkdir -p "$HOME"/.local/bin

mv "$PWD"/kubectl "$HOME"/.local/bin/kubectl

echo -n "Enter the location of your configuration file. [default: ~/.bashrc] "
read -r 
