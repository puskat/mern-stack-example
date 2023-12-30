
replicaCount = 1

image_repository = "server"
image_tag = "latest"
image_pullPolicy = "Never"

service_type = "NodePort"
service_port = 5000
service_nodePort = 30001

livenessProbe_initialDelaySeconds = 30
livenessProbe_periodSeconds = 10

readinessProbe_initialDelaySeconds = 10
readinessProbe_periodSeconds = 10

server_auth_password = "password123"
server_auth_username = "my_user"
server_auth_database = "employees"
