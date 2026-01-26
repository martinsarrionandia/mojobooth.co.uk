locals {
  additional_middlewares_maps = [
    jsondecode(data.kubernetes_config_map_v1.aws-rancher-config.data["crowdsec-bouncer-middleware-map"])
  ]
  http_proxy = jsondecode(data.kubernetes_config_map_v1.aws-rancher-config.data["http-proxy"])

  kubectl_file = pathexpand("~/.kube/${var.kube_config_fqdn}")
}