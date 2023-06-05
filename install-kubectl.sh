#!/bin/bash

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

chmod +x kubectl

mkdir -p $HOME/.local/bin

mv $PWD/kubectl $HOME/.local/bin/kubectl

echo "PATH=\$PATH:\$HOME/.local/bin" >> $HOME/.bashrc

echo "Now either restart your shell or run source .bashrc"
