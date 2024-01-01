#!/bin/bash

# Start Minikube
minikube start  

# Enable Add-ons
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons enable ingress
minikube addons enable ingress-dns



echo "Minikube setup completed."

