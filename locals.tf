locals {
  additional_middlewares = [data.kubernetes_config_map_v1.aws-rancher-config.data["crowdsec-bouncer-middleware"]]
  kubectl_file           = pathexpand("~/.kube/${var.kube-config-fqdn}")
}