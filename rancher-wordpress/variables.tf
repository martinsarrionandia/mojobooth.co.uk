variable "domain" {
  type    = string
  default = "photobooth.wales"
}

variable "hostname" {
  type    = string
  default = "@"
}

variable "release-name" {
  type    = string
  default = "mojobooth"
}

variable "release-repo" {
  type    = string
  default = "https://charts.bitnami.com/bitnami"
}

variable "release-chart" {
  type    = string
  default = "wordpress"
}