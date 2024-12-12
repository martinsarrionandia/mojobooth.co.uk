locals {
  additional-middlewares = [data.terraform_remote_state.rancher-config.outputs.crowdsec-bouncer-middleware]
}