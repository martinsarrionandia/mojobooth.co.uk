terraform {
  backend "s3" {
    bucket  = "mojobooth.co.uk"
    key     = "terraform-state/rancher/terraform.tfstate"
    region  = "eu-west-1"
    encrypt = true
  }
}