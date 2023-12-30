replicaCount = 1

image_repository = "client"
image_pullPolicy = "Never"

service_type = "NodePort"
service_port = 80
service_targetPort = 80

ingress_hosts = "mern.minikube.test"
ingress_secretName = "mern-tls"
ingress_host = "mern.minikube.test"
ingress_clientName = "client"
ingress_clientPath = "/"
ingress_clientPort = 80
ingress_clientPathType = "Prefix"
ingress_serviceName = "server"
ingress_servicePath = "/api"
ingress_servicePort = 5000
ingress_servicePathType = "Prefix"

livenessProbe_initialDelaySeconds = 30
livenessProbe_periodSeconds = 10

readinessProbe_initialDelaySeconds = 5
readinessProbe_periodSeconds = 10
