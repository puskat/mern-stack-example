# MERN Stack Project Development Process

## Introduction

In this document, I detail the steps I undertook to develop, dockerize, and deploy the MERN (MongoDB, Express.js, React, Node.js) stack project, utilizing Helm, Terraform, and Minikube.

## Dockerization

### Initial Step
I started by dockerizing the server and client using their source code and chose a Bitnami image for MongoDB. This method simplified the MongoDB setup, including the creation of users and passwords through environment variables.

### Database Connection
For the database connection, I configured the `conn.js` file in the server. This step was crucial to ensure a successful connection to MongoDB.

## Kubernetes Deployment

All Kubernetes configuration files are stored in the `k8s` folder. These files are simpler than the ones in the templates but were retained for developmental insights.

### MongoDB
For MongoDB, I created a deployment file that includes manifests for Persistent Volume (PV) and Persistent Volume Claim (PVC), and a service file. The PV and PVC ensure MongoDB has persistent storage on the node. Username, database, and password are declared as environment variables at this stage.

### Server and Client
- **Server**: Deployment and service manifest files were developed. Credentials were initially hardcoded for development purposes.
- **Client**: Along with deployment and service manifests, I added an ingress file to direct traffic to port 3000, where the React application runs in development mode.

## Helm Chart Implementation

After verifying functionality in Kubernetes, I began developing Helm charts for each application.

### Parameterization
I parameterized the Kubernetes files, allowing values from Helm's `values.yaml` files to be used. Application manifest files were parameterized individually for ease of debugging.

## SSL Integration

To integrate SSL:
1. I built and served the React project using Nginx.
2. Generated SSL keys and edited the local host file with Minikube's IP, then created an `nginx.conf` file to route requests to `mern.minikube.test`.
3. Enabled Minikube Ingress and configured it for both server and client in their respective service files.
4. Updated the client and server source code to communicate via the Ingress instead of direct URLs, with the server routes including the `/api` endpoint.

## Implementing Kubernetes Secrets and Health Checks

1. I fully parameterized the server's database string to use environment variables.
2. Passed these variables to the containers using Kubernetes secrets.
3. Added a health check to the server to monitor the database connection.

## Terraform Integration

I created three separate Terraform projects for the server, client, and MongoDB. I declared all necessary variables in the `main.tf` files to make each application configurable through Terraform.

## HPA Integration
Finally, horizontal pod autoscaling is added and enabled for ensured uptime under possible load. 
