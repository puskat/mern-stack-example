#!/bin/bash

# Start Minikube
minikube start  

# Enable Add-ons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable ingress-dns



echo "Minikube setup completed."


#building docker images for server and client. You can  run the below commands in mern directory. You need to run these 
#commands and the follow up commands in the same session so terraform, helm and minikube can access the docker images 

#after this command, images will be seen by the cluster
#eval $(minikube docker-env) 
#
#docker build -t client ./client
#docker build -t server ./server
#
#echo "server and client images are ready."