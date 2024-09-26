data "aws_route53_zone" "mojobooth" {
  name         = var.domain
  private_zone = false
}

resource "aws_route53_record" "www_mojobooth" {
  zone_id = data.aws_route53_zone.mojobooth.zone_id
  name    = var.endpoint-fqdn
  type    = "A"
  ttl     = "300"
  records = [data.terraform_remote_state.rancher-infra.outputs.public_ip]
}