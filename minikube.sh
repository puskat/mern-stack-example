#!/bin/bash

# Start Minikube
minikube start  # Change driver as needed

# Enable Add-ons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable ingress-dns

#after this command, images will be seen by the cluster
eval $(minikube docker-env) 

echo "Minikube setup completed."


#building docker images for server and client. You can 

#after this command, images will be seen by the cluster
#eval $(minikube docker-env) 
#
#docker build -t client ./client
#docker build -t server ./server
#
#echo "server and client images are ready."