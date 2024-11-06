variable domain {
    type = string
    default = "photobooth.wales"
}

variable wordpress-credentials-arn {
    type = string
    default = "arn:aws:secretsmanager:eu-west-2:281287281094:secret:mojobooth.co.uk-NNUJeo"
}

variable "release-name" {
  type    = string
  default = "mojobooth"
}