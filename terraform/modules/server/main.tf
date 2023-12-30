resource "helm_release" "server" {
  name       = "server"
  chart      = "/home/onur/Documents/mern/helm/server"
}
