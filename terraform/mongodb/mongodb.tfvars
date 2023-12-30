
image_repository = "bitnami/mongodb"
image_tag = "4.4.6"
image_pullPolicy = "IfNotPresent"

persistence_enabled = true
persistence_storageClass = "standard"
persistence_accessModes = "ReadWriteOnce"
persistence_size = "1Gi"
persistence_hostPath = "/tmp/mongodb"

resources_requests_memory = "256Mi"
resources_requests_cpu = "100m"
resources_limits_memory = "512Mi"
resources_limits_cpu = "200m"

service_name = "mongodb"
service_type = "ClusterIP"
service_port = 27017

securityContext_runAsUser = 1001
securityContext_fsGroup = 1001

livenessProbe_initialDelaySeconds = 30
livenessProbe_periodSeconds = 10

readinessProbe_initialDelaySeconds = 5
readinessProbe_periodSeconds = 10

autoScaling_enabled = "yes"

mongodb_auth_password = "password123"
mongodb_auth_username = "my_user"
mongodb_auth_database = "employees"
