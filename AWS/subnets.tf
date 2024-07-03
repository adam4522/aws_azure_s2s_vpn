#2 subnets (private and public) in vpc a avaliability zone 1

resource "aws_subnet" "vpc_a_subnet_public_AZ1" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.196.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_a_subnet_public_(AZ1)"
  }
}

resource "aws_subnet" "vpc_a_subnet_private_AZ1" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.196.11.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_a_subnet_private_(AZ1)"
  }
}

#2 subnets (private and public) in vpc a avaliability zone 2

resource "aws_subnet" "vpc_a_subnet_public_AZ2" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.196.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_a_subnet_public_(AZ2)"
  }
}

resource "aws_subnet" "vpc_a_subnet_private_AZ2" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.196.12.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_a_subnet_private_(AZ2)"
  }
}


#2 subnets (private and public) in vpc a avaliability zone 3

resource "aws_subnet" "vpc_a_subnet_public_AZ3" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.196.3.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_a_subnet_public_(AZ3)"
  }
}

resource "aws_subnet" "vpc_a_subnet_private_AZ3" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.196.13.0/24"
  availability_zone = "us-east-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_a_subnet_private_(AZ3)"
  }
}

#####################################################################

#2 subnets (private and public) in vpc b avaliability zone 1

resource "aws_subnet" "vpc_b_subnet_public_AZ1" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "172.16.0.0/27"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_b_subnet_public_(AZ1)"
  }
}

resource "aws_subnet" "vpc_b_subnet_private_AZ1" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "172.16.0.32/27"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "vpc_b_subnet_private_(AZ1)"
  }
}