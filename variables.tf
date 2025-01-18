variable "domain" {
  type    = string
  default = "photobooth.wales"
}

variable "wordpress-credentials-arn" {
  type    = string
  default = "arn:aws:secretsmanager:eu-west-2:281287281094:secret:mojobooth.co.uk-NNUJeo"
}

variable "release-name" {
  type    = string
  default = "mojobooth"
}

variable "ebs-volname-wordpress-root" {
  type    = string
  default = "rancher-mojobooth-wordpress-root"
}

variable "ebs-volname-wordpress-mariadb" {
  type    = string
  default = "rancher-mojobooth-wordpress-maria"
}

variable "ebs-volname-wordpress-uploads" {
  type    = string
  default = "rancher-mojobooth-wordpress-uploads"
}

variable "kube-config-fqdn" {
  type    = string
  default = "rancher.sarrionandia.co.uk"
}