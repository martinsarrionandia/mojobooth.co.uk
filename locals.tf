locals {
  additional-middlewares = [data.kubernetes_config_map.aws-rancher-config.data["crowdsec-bouncer-middleware"]]
  kubectl-file           = pathexpand("~/.kube/${var.kube-config-fqdn}")
}