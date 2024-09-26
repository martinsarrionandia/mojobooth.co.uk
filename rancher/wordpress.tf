resource "helm_release" "wordpress" {
  namespace        = kubernetes_namespace.mojobooth.metadata.0.name
  name             = "mojobooth"
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "wordpress"

  set {
    name  = "replicaCount"
    value = "1"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "persistence.existingClaim"
    value = kubernetes_persistent_volume_claim.wordpress_root.metadata.0.name
  }

  set {
    name  = "mariadb.primary.persistence.existingClaim"
    value = kubernetes_persistent_volume_claim.wordpress_maria.metadata.0.name
  }

  set {
    name  = "volumePermissions.enabled"
    value = "true"
  }

  set {
    name  = "containerSecurityContext.enabled"
    value = "false"
  }
  
}