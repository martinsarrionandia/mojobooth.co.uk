# AWS Provider 
provider "aws" {
  region = data.terraform_remote_state.rancher-infra.outputs.region
}

# Helm Provider
provider "helm" {
  kubernetes {
    config_path = pathexpand("~/.kube/config")
  }
}

# Kubernetes Provider
provider "kubernetes" {
  config_path = pathexpand("~/.kube/config")
}