
variable "replicaCount" {
  description = "The number of replicas to deploy for the client application"
}

variable "image_repository" {
  description = "The repository location of the client application's Docker image"
}

variable "image_pullPolicy" {
  description = "The image pull policy for the client application's Docker image"
}

variable "service_type" {
  description = "The type of Kubernetes service to be used for the client application"
}

variable "service_port" {
  description = "The port on which the client service is exposed"
}

variable "service_targetPort" {
  description = "The target port on the pod for the client service"
}

variable "ingress_hosts" {
  description = "The hostnames used in the ingress for the client application"
}

variable "ingress_secretName" {
  description = "The name of the TLS secret to use for the client ingress"
}

variable "ingress_host" {
  description = "The host for the client application's ingress resource"
}

variable "ingress_clientName" {
  description = "The name identifier for the client in the ingress resource"
}

variable "ingress_clientPath" {
  description = "The path for the client application in the ingress resource"
}

variable "ingress_clientPort" {
  description = "The port used for the client application in the ingress resource"
}

variable "ingress_clientPathType" {
  description = "The type of path matching used in the ingress for the client"
}

variable "ingress_serviceName" {
  description = "The name of the backend service in the ingress for the client application"
}

variable "ingress_servicePath" {
  description = "The path for the backend service in the ingress resource"
}

variable "ingress_servicePort" {
  description = "The port used for the backend service in the ingress resource"
}

variable "ingress_servicePathType" {
  description = "The type of path matching used for the backend service in the ingress"
}

variable "livenessProbe_initialDelaySeconds" {
  description = "The initial delay in seconds for the liveness probe of the client pod"
}

variable "livenessProbe_periodSeconds" {
  description = "The period in seconds to perform the liveness probe"
}

variable "readinessProbe_initialDelaySeconds" {
  description = "The initial delay in seconds for the readiness probe of the client pod"
}

variable "readinessProbe_periodSeconds" {
  description = "The period in seconds to perform the readiness probe"
}

variable "resources_requests_memory" {
  description = "Memory requests for client"
}

variable "resources_requests_cpu" {
  description = "CPU requests for client"
}

variable "resources_limits_memory" {
  description = "Memory limits for client"
}

variable "resources_limits_cpu" {
  description = "CPU limits for client"
}
