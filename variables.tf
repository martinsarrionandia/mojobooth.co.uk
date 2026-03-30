variable "domain" {
  type    = string
  default = "photobooth.wales"
}

variable "wordpress_credentials_arn" {
  type    = string
  default = "arn:aws:secretsmanager:eu-west-2:281287281094:secret:mojobooth.co.uk-NNUJeo"
}

variable "release_name" {
  type    = string
  default = "mojobooth"
}

variable "release_version" {
  type    = string
  default = "29.2.8"
}

variable "ebs_volname_wordpress_root" {
  type    = string
  default = "rancher-mojobooth-wordpress-root"
}

variable "ebs_volname_wordpress_mariadb" {
  type    = string
  default = "rancher-mojobooth-wordpress-maria"
}

variable "ebs_volname_wordpress_uploads" {
  type    = string
  default = "rancher-mojobooth-wordpress-uploads"
}

variable "kube_config_fqdn" {
  type    = string
  default = "rancher.sarrionandia.co.uk"
}

variable "wpadmin_ip_allowlist" {
  type    = list(string)
  default = ["185.81.253.0/24"]
}