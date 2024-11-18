module "mojobooth-cdn" {
  source = "github.com/martinsarrionandia/tfmod-cdn.git"
  domain = var.domain
}

module "mojobooth-wordpress" {
  source                        = "github.com/martinsarrionandia/tfmod-aws-k8s-wordpress.git"
  domain                        = var.domain
  release-name                  = "mojobooth"
  initial-setup                 = false
  amazon-ebs-class              = data.terraform_remote_state.rancher-config.outputs.amazon-ebs-class
  public-ip                     = data.terraform_remote_state.rancher-infra.outputs.public-ip
  ebs-volname-wordpress-root    = "rancher-mojobooth-wordpress-root"
  ebs-volname-wordpress-mariadb = "rancher-mojobooth-wordpress-maria"
  ebs-volname-wordpress-uploads = "rancher-mojobooth-wordpress-uploads"
  wordpress-credentials-arn     = var.wordpress-credentials-arn
  cdn-s3-user-secret-arn        = module.mojobooth-cdn.secret-arn
  cdn-bucket-name               = module.mojobooth-cdn.cdn-bucket-name
  cluster-issuer                = data.terraform_remote_state.rancher-config.outputs.cluster-issuer
}