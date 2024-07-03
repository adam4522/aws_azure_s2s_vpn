resource "aws_vpc" "vpc_a" {
  cidr_block       = "10.196.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_a"
  }
}

resource "aws_vpc" "vpc_b" {
  cidr_block       = "172.16.0.0/26"
  instance_tenancy = "default"

  tags = {
    Name = "vpc_b"
  }
}