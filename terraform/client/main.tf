provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "client" {
  name  = "client"
  chart = "/home/onur/Documents/mern/helm/client"


  set {
    name  = "replicaCount"
    value = var.replicaCount
  }

  set {
    name  = "image.repository"
    value = var.image_repository
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
    name  = "service.targetPort"
    value = var.service_targetPort
  }

  set {
    name  = "ingress.hosts"
    value = var.ingress_hosts
  }

  set {
    name  = "ingress.secretName"
    value = var.ingress_secretName
  }

  set {
    name  = "ingress.host"
    value = var.ingress_host
  }

  set {
    name  = "ingress.clientName"
    value = var.ingress_clientName
  }

  set {
    name  = "ingress.clientPath"
    value = var.ingress_clientPath
  }

  set {
    name  = "ingress.clientPort"
    value = var.ingress_clientPort
  }

  set {
    name  = "ingress.clientPathType"
    value = var.ingress_clientPathType
  }

  set {
    name  = "ingress.serviceName"
    value = var.ingress_serviceName
  }

  set {
    name  = "ingress.servicePath"
    value = var.ingress_servicePath
  }

  set {
    name  = "ingress.servicePort"
    value = var.ingress_servicePort
  }

  set {
    name  = "ingress.servicePathType"
    value = var.ingress_servicePathType
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
