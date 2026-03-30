data "kubernetes_config_map_v1" "aws-rancher-config" {
  metadata {
    name = "aws-rancher-config"
  }
}

data "http" "artifacthub_wordpress" {
  url = "https://artifacthub.io/api/v1/packages/helm/bitnami/wordpress/?json"

  request_headers = {
    Accept = "application/json"
  }
}