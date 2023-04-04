#!/bin/bash


#Install kubectl 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# move cred connect to the cluster
mkdir /home/ubuntu/.aws




# Install Helm
sudo apt-get update && sudo apt-get install helm

# Add ingress nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx  

# Install ingress nginx
helm install ingress-nginx ingress-nginx/ingress-nginx

