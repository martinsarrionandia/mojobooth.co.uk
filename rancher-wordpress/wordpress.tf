resource "helm_release" "wordpress" {
  namespace  = kubernetes_namespace.mojobooth.metadata.0.name
  name       = var.release-name
  repository = var.release-repo
  chart      = var.release-chart

  set {
    name  = "replicaCount"
    value = "1"
  }

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  # Disable network policy as it will be created manually
  set {
    name  = "networkPolicy.enabled"
    value = "false"
  }

  set {
    name  = "service.annotations.external-dns\\.alpha\\.kubernetes\\.io/hostname"
    value = yamlencode(local.fqdn)
    type = "string"
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
    value = "true"
  }

  set {
    name  = "wordpressUsername"
    value = jsondecode(data.aws_secretsmanager_secret_version.mojobooth_current.secret_string)["wordpressUsername"]
  }

  set {
    name  = "wordpressPassword"
    value = jsondecode(data.aws_secretsmanager_secret_version.mojobooth_current.secret_string)["wordpressPassword"]
  }

  set {
    name  = "mariadb.auth.rootPassword"
    value = jsondecode(data.aws_secretsmanager_secret_version.mojobooth_current.secret_string)["mariadb.auth.rootPassword"]
  }

  set {
    name  = "mariadb.auth.password"
    value = jsondecode(data.aws_secretsmanager_secret_version.mojobooth_current.secret_string)["mariadb.auth.password"]
  }
}