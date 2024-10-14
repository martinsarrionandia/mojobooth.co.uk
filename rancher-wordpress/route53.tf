data "aws_route53_zone" "domain" {
  name         = var.domain
  private_zone = false
}

#resource "aws_route53_record" "mojobooth-apex" {
#  zone_id = data.aws_route53_zone.domain.id
#  name    = "${var.domain}"
#  type    = "A"
#  ttl     = "300"
#  records = [data.terraform_remote_state.rancher-infra.outputs.public-ip]
#}