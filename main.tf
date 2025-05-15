module "mojobooth-cdn" {
  source = "github.com/martinsarrionandia/tfmod-cdn.git"
  domain = var.domain
}

module "mojobooth-sendmail" {
  source            = "github.com/martinsarrionandia/tfmmod-aws-sendmail.git"
  domain            = var.domain
}

module "mojobooth-wordpress" {
  source                        = "github.com/martinsarrionandia/tfmod-aws-k8s-wordpress.git"
  domain                        = var.domain
  release-name                  = var.release-name
  initial-setup                 = false
  amazon-ebs-class              = data.kubernetes_config_map.aws-rancher-config.data["amazon-ebs-class"]
  public-ip                     = data.kubernetes_config_map.aws-rancher-config.data["public-ip"]
  ebs-volname-wordpress-root    = var.ebs-volname-wordpress-root
  ebs-volname-wordpress-mariadb = var.ebs-volname-wordpress-mariadb
  ebs-volname-wordpress-uploads = var.ebs-volname-wordpress-uploads
  wordpress-credentials-arn     = var.wordpress-credentials-arn
  cdn-s3-user-secret-arn        = module.mojobooth-cdn.secret-arn
  cdn-bucket-name               = module.mojobooth-cdn.cdn-bucket-name
  cluster-issuer                = data.kubernetes_config_map.aws-rancher-config.data["cluster-issuer"]
  additional-middlewares        = local.additional-middlewares
}