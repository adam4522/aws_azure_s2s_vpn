provider "aws" {
  region  =  var.region
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-adam-canterill"
    key    = "s2svpn/terraform.tfstate"
    region = "us-east-1"
  }
}
