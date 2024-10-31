resource "kubernetes_manifest" "wordpress_network_policy" {
  manifest = yamldecode(templatefile("${path.module}/templates/wordpress_network_policy.yaml",
    {
      release-name = var.release-name,
      namespace    = kubernetes_namespace.mojobooth.metadata.0.name
  }))
}

resource "kubernetes_manifest" "mariadb_network_policy" {
  manifest = yamldecode(templatefile("${path.module}/templates/matriadb_network_policy.yaml",
    {
      release-name = var.release-name,
      namespace    = kubernetes_namespace.mojobooth.metadata.0.name
  }))
}