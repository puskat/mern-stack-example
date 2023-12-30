provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "mongodb" {
  name       = "mongodb"
  chart      = "/home/onur/Documents/mern/helm/mongodb"

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
    name  = "persistence.enabled"
    value = var.persistence_enabled
  }

  set {
    name  = "persistence.storageClass"
    value = var.persistence_storageClass
  }

  set {
    name  = "persistence.accessModes[0]"
    value = var.persistence_accessModes
  }

  set {
    name  = "persistence.size"
    value = var.persistence_size
  }

  set {
    name  = "persistence.hostPath"
    value = var.persistence_hostPath
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

  set {
    name  = "service.name"
    value = var.service_name
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
    name  = "securityContext.runAsUser"
    value = var.securityContext_runAsUser
  }

  set {
    name  = "securityContext.fsGroup"
    value = var.securityContext_fsGroup
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
    name  = "autoScaling.enabled"
    value = var.autoScaling_enabled
  }

  set {
    name  = "mongodb.auth.password"
    value = var.mongodb_auth_password
  }

  set {
    name  = "mongodb.auth.username"
    value = var.mongodb_auth_username
  }

  set {
    name  = "mongodb.auth.database"
    value = var.mongodb_auth_database
  }
}
