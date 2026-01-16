locals {
  additional-middlewares = [data.kubernetes_config_map_v1.aws-rancher-config.data["crowdsec-bouncer-middleware"]]
  kubectl-file           = pathexpand("~/.kube/${var.kube-config-fqdn}")
}