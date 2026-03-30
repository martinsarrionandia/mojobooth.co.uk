module "mojobooth-cdn" {
  source = "github.com/martinsarrionandia/tfmod-cdn.git"
  domain = var.domain
}

module "mojobooth-sendmail" {
  source = "github.com/martinsarrionandia/tfmmod-aws-sendmail.git"
  domain = var.domain
}

module "mojobooth-wordpress" {
  source                        = "github.com/martinsarrionandia/tfmod-aws-k8s-wordpress.git"
  domain                        = var.domain
  release_name                  = var.release_name
  release_version               = var.release_version
  initial_setup                 = false
  amazon_ebs_class              = data.kubernetes_config_map_v1.aws-rancher-config.data["amazon-ebs-class"]
  public_ip                     = data.kubernetes_config_map_v1.aws-rancher-config.data["public-ip"]
  ebs_volname_wordpress_root    = var.ebs_volname_wordpress_root
  ebs_volname_wordpress_mariadb = var.ebs_volname_wordpress_mariadb
  ebs_volname_wordpress_uploads = var.ebs_volname_wordpress_uploads
  wordpress_credentials_arn     = var.wordpress_credentials_arn
  cdn_s3_user_secret_arn        = module.mojobooth-cdn.secret_arn
  cdn_bucket_name               = module.mojobooth-cdn.cdn_bucket_name
  cluster_issuer                = data.kubernetes_config_map_v1.aws-rancher-config.data["cluster-issuer"]
  additional_middlewares_maps   = local.additional_middlewares_maps
  http_proxy                    = local.http_proxy
  wpadmin_ip_allowlist          = var.wpadmin_ip_allowlist
}