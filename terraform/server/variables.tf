variable "replicaCount" {
  description = "Number of replicas for the server"
}

variable "image_repository" {
  description = "Repository for the server image"
}

variable "image_tag" {
  description = "Tag for the server image"
}

variable "image_pullPolicy" {
  description = "Pull policy for the server image"
}

variable "service_type" {
  description = "Type of service for the server"
}

variable "service_port" {
  description = "Port for the server service"
}

variable "service_nodePort" {
  description = "Node port for the server service"
}

variable "livenessProbe_initialDelaySeconds" {
  description = "Initial delay seconds for the server liveness probe"
}

variable "livenessProbe_periodSeconds" {
  description = "Period seconds for the server liveness probe"
}

variable "readinessProbe_initialDelaySeconds" {
  description = "Initial delay seconds for the server readiness probe"
}

variable "readinessProbe_periodSeconds" {
  description = "Period seconds for the server readiness probe"
}

variable "server_auth_password" {
  description = "Password for server-db authentication"
}

variable "server_auth_username" {
  description = "Username for server-db authentication"
}

variable "server_auth_database" {
  description = "Database name for server-db authentication"
}

variable "server_auth_host" {
  description = "Host name for server-db authentication"
}

variable "server_auth_port" {
  description = "Port for server-db authentication"
}

variable "resources_requests_memory" {
  description = "Memory requests for Server"
}

variable "resources_requests_cpu" {
  description = "CPU requests for Server"
}

variable "resources_limits_memory" {
  description = "Memory limits for Server"
}

variable "resources_limits_cpu" {
  description = "CPU limits for Server"
}
