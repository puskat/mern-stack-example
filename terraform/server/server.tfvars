
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
server_auth_host = "mongodb"
server_auth_port = "27017"

resources_requests_memory = "256Mi"
resources_requests_cpu = "100m"
resources_limits_memory = "512Mi"
resources_limits_cpu = "200m"