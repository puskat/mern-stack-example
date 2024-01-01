provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "server" {
  name       = "server"
  chart      = "/home/onur/Documents/mern/helm/server"

  set {
    name  = "replicaCount"
    value = var.replicaCount
  }

  set {
    name  = "image.repository"
    value = var.image_repository
  }

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "image.pullPolicy"
    value = var.image_pullPolicy
  }

  set {
    name  = "service.type"
    value = var.service_type
  }

  set {
    name  = "service.port"
    value = var.service_port
  }

  set {
    name  = "service.nodePort"
    value = var.service_nodePort
  }

  set {
    name  = "livenessProbe.initialDelaySeconds"
    value = var.livenessProbe_initialDelaySeconds
  }

  set {
    name  = "livenessProbe.periodSeconds"
    value = var.livenessProbe_periodSeconds
  }

  set {
    name  = "readinessProbe.initialDelaySeconds"
    value = var.readinessProbe_initialDelaySeconds
  }

  set {
    name  = "readinessProbe.periodSeconds"
    value = var.readinessProbe_periodSeconds
  }

  set {
    name  = "server.auth.password"
    value = var.server_auth_password
  }

  set {
    name  = "server.auth.username"
    value = var.server_auth_username
  }

  set {
    name  = "server.auth.database"
    value = var.server_auth_database
  }
  set {
    name  = "resources.requests.memory"
    value = var.resources_requests_memory
  }

  set {
    name  = "resources.requests.cpu"
    value = var.resources_requests_cpu
  }

  set {
    name  = "resources.limits.memory"
    value = var.resources_limits_memory
  }

  set {
    name  = "resources.limits.cpu"
    value = var.resources_limits_cpu
  }
}
