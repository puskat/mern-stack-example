resource "helm_release" "mongodb" {
  name       = "mongodb"
  chart      = "/home/onur/Documents/mern/helm/mongodb"
}
