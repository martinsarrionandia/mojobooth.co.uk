data "aws_secretsmanager_secret" "rancher" {
  arn = "arn:aws:secretsmanager:eu-west-2:281287281094:secret:rancher-QeIi1B"
}

data "aws_secretsmanager_secret_version" "rancher-current" {
  secret_id = data.aws_secretsmanager_secret.rancher.id
}

data "aws_secretsmanager_secret" "mojobooth" {
  arn = "arn:aws:secretsmanager:eu-west-2:281287281094:secret:mojobooth.co.uk-NNUJeo"
}

data "aws_secretsmanager_secret_version" "mojobooth_current" {
  secret_id = data.aws_secretsmanager_secret.mojobooth.id
}