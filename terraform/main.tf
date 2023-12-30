provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

module "mongodb" {
  source = "./modules/mongodb"
  # Add any required variables or configurations specific to MongoDB
}

module "server" {
  source = "./modules/server"
  # Add variables specific to Server module
  # Ensure this module depends on MongoDB module
  depends_on = [module.mongodb]
}

module "client" {
  source = "./modules/client"
  # Add variables specific to Client module
  # Ensure this module depends on Server module
  depends_on = [module.server]
}
