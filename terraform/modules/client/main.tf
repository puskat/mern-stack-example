resource "helm_release" "client" {
  name       = "client"
  chart      = "/home/onur/Documents/mern/helm/client"
}
