resource "kubernetes_manifest" "mojobooth-ingress" {
  manifest = {
    apiVersion = "networking.k8s.io/v1"
    kind = "Ingress"
    metadata = {
      annotations = {
        "cert-manager.io/cluster-issuer" = data.terraform_remote_state.rancher-config.outputs.cluster-issuer
      }
      labels = {
        app = helm_release.wordpress.metadata.0.chart
      }
      name = helm_release.wordpress.metadata.0.name
      namespace = kubernetes_namespace.mojobooth.metadata.0.name
    }
    spec = {
      rules = [
        {
          host = local.fqdn
          http = {
            paths = [
              {
                backend = {
                  service = {
                    name = "${helm_release.wordpress.metadata.0.name}-${helm_release.wordpress.metadata.0.chart}"
                    port = {
                      number = 80
                    }
                  }
                }
                path = "/"
                pathType = "Prefix"
              },
            ]
          }
        },
      ]
      tls = [
        {
          hosts = [
            local.fqdn,
          ]
          secretName = data.terraform_remote_state.rancher-config.outputs.cluster-issuer
        },
      ]
    }
  }
}