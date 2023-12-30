variable "image_repository" {
  description = "Repository for the MongoDB image"
}

variable "image_tag" {
  description = "Tag for the MongoDB image"
}

variable "image_pullPolicy" {
  description = "Image pull policy for MongoDB"
}

variable "persistence_enabled" {
  description = "Enable persistence for MongoDB"
}

variable "persistence_storageClass" {
  description = "Storage class for MongoDB persistence"
}

variable "persistence_accessModes" {
  description = "Access modes for MongoDB persistence volume"
}

variable "persistence_size" {
  description = "Size of the MongoDB persistence volume"
}

variable "persistence_hostPath" {
  description = "Host path for MongoDB persistence volume (single-node setups)"
}

variable "resources_requests_memory" {
  description = "Memory requests for MongoDB"
}

variable "resources_requests_cpu" {
  description = "CPU requests for MongoDB"
}

variable "resources_limits_memory" {
  description = "Memory limits for MongoDB"
}

variable "resources_limits_cpu" {
  description = "CPU limits for MongoDB"
}

variable "service_name" {
  description = "Service name for MongoDB"
}

variable "service_type" {
  description = "Service type for MongoDB"
}

variable "service_port" {
  description = "Service port for MongoDB"
}

variable "securityContext_runAsUser" {
  description = "User ID for the MongoDB security context"
}

variable "securityContext_fsGroup" {
  description = "Group ID for the MongoDB security context"
}

variable "livenessProbe_initialDelaySeconds" {
  description = "Initial delay seconds for MongoDB liveness probe"
}

variable "livenessProbe_periodSeconds" {
  description = "Period seconds for MongoDB liveness probe"
}

variable "readinessProbe_initialDelaySeconds" {
  description = "Initial delay seconds for MongoDB readiness probe"
}

variable "readinessProbe_periodSeconds" {
  description = "Period seconds for MongoDB readiness probe"
}

variable "autoScaling_enabled" {
  description = "Enable auto scaling for MongoDB"
}

variable "mongodb_auth_password" {
  description = "Password for MongoDB authentication"
}

variable "mongodb_auth_username" {
  description = "Username for MongoDB authentication"
}

variable "mongodb_auth_database" {
  description = "Database for MongoDB authentication"
}
