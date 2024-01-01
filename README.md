# MERN Stack Project Deployment Guide

## Prerequisites
- Terraform 1.6.6
- Helm v3.13.3
- Docker Engine (for building images)
- Minikube (for local deployment)

## Deployment Steps

### 1. Install Minikube
   - Install Minikube for creating a local Kubernetes cluster.

### 2. Create Minikube Cluster
   - Run the `minikube.sh` script to create a Minikube cluster and add necessary add-ons.

### 3. SSL Configuration
   The project is configured for SSL connection. Follow these steps:
   - Decide the URL for the project (default: `mern.minikube.test`). 
   - Create SSL key files in the `mern/client/nginx` directory:
     ```
     openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout mern.key -out mern.crt -subj "/CN=mern.minikube.test"
     ```
   - Edit `/etc/hosts` and add your Minikube IP and URL, like:
     ```
     192.168.49.2 mern.minikube.test
     ```
   - If using a different URL, update the `nginx.conf` file accordingly.

### 4. Configure Docker Environment
   - Run `eval $(minikube docker-env)` so Minikube can access Docker images.

### 5. Build Docker Images
   - Build Docker images for `server` and `client`:
     ```
     docker build -t client ./client
     docker build -t server ./server
     ```

### 6. Deploy with Terraform
   Deploy MongoDB, server, and client using Terraform:
   - For MongoDB:
     ```
     cd /mern/terraform/mongodb
     terraform init
     terraform apply --var-file=mongodb.tfvars
     ```
   - For Server:
     ```
     cd /mern/terraform/server
     terraform init
     terraform apply --var-file=server.tfvars
     ```
   - For Client:
     ```
     cd /mern/terraform/client
     terraform init
     terraform apply --var-file=client.tfvars
     ```

### 7. Alternative Deployment with Helm
   Deploy using Helm by running:
   - MongoDB:
     ```
     cd /mern/helm/mongodb
     helm install mongodb .
     ```
   - Server:
     ```
     cd /mern/helm/server
     helm install server .
     ```
   - Client:
     ```
     cd /mern/helm/client
     helm install client .
     ```

### 8. Monitor the Cluster
   - Enable Minikube Kubernetes dashboard:
     ```
     minikube dashboard
     ```

## Conclusion
Follow these steps to deploy and manage the MERN stack project on a Minikube Kubernetes cluster. Adjust the configurations as needed for your specific deployment requirements.
