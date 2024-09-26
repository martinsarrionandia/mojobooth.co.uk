resource "kubernetes_manifest" "mojobooth-ingress" {
  manifest = yamldecode(templatefile("${path.module}/templates/ingress.yaml",
    {
      namespace      = kubernetes_namespace.mojobooth.metadata.0.name,
      app-name       = helm_release.wordpress.metadata.0.name,
      chart-name     = helm_release.wordpress.metadata.0.chart,
      cluster-issuer = data.terraform_remote_state.rancher-config.outputs.cluster-issuer,
      endpoint-fqdn  = aws_route53_record.www_mojobooth.fqdn
  }))
}