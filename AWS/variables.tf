variable "region" {
    default = "us-east-1"
}

variable "s3_backend_bucket" {
    default = "terraform-backend-adam-canterill"
}

variable "s3_backend_key" {
    default = "s2svpn/terraform.tfstate"
    type = string
}

