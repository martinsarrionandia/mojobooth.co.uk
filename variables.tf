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

variable "additional-middlewares-map" {
  type = list(map(string))
  default = [
    {
      "name"      = "bouncer"
      "namespace" = "traefik"
    }
  ]
}