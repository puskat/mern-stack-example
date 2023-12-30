provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "mongodb" {
  name       = "mongodb"
  chart      = "../helm/mongodb"
}

resource "helm_release" "client" {
  name       = "client"
  chart      = "../helm/client"
  depends_on = [helm_release.server]

}

resource "helm_release" "server" {
  name       = "server"
  chart      = "../helm/server"
  depends_on = [helm_release.mongodb]

}
