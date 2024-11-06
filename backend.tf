terraform {
  backend "s3" {
    bucket  = "mojobooth.co.uk"
    key     = "terraform-state/mojobooth.co.uk/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = true
  }
}