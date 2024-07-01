#vpc a created for first part of transit gw connection
module "vpc_a" {
  source = "./modules/vpc_module"
  cidr_block = "10.196.0.0/16"
  vpc_name = "vpc_a"
}

module "vpc_a_subnet_public" {
  source = "./modules/subnet_module"
  subnet_name = "vpc_a_subnet_public"
  subnet_cidr_block = "10.196.1.0/24"
  az = "us-east-1a"
  vpc_id = module.vpc_a.vpc_id
}

module "vpc_a_subnet_private" {
  source = "./modules/subnet_module"
  subnet_name = "vpc_a_subnet_private"
  subnet_cidr_block = "10.196.2.0/24"
  az = "us-east-1a"
  vpc_id = module.vpc_a.vpc_id
}


resource "aws_internet_gateway" "igw_vpc_a" {
  vpc_id = module.vpc_a.vpc_id

  tags = {
    Name = "vpc_a_igw"
  }
}

resource "aws_route_table" "vpca_public_rt" {
  vpc_id = module.vpc_a.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_a.id
  }
  tags = {
    Name = "igw_vpc_a"
  }
}


resource "aws_route_table_association" "vpca_subnet_assoc" {
  subnet_id      = module.vpc_a_subnet_public.subnet_id
  route_table_id = aws_route_table.vpca_public_rt.id
}

###################################################################
###################################################################

module "vpc_b" {
  source = "./modules/vpc_module"
  cidr_block = "172.16.0.0/26"
  vpc_name = "vpc_b"
}

module "vpc_b_subnet_public" {
  source = "./modules/subnet_module"
  subnet_name = "vpc_b_subnet_public"
  subnet_cidr_block = "172.16.0.0/27"
  az = "us-east-1a"
  vpc_id = module.vpc_b.vpc_id
}


resource "aws_internet_gateway" "igw_vpc_b" {
  vpc_id = module.vpc_b.vpc_id

  tags = {
    Name = "vpc_b_igw"
  }
}

resource "aws_route_table" "vpcb_public_rt" {
  vpc_id = module.vpc_b.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_vpc_b.id
  }
  tags = {
    Name = "igw_vpc_b"
  }
}


resource "aws_route_table_association" "vpcb_subnet_assoc" {
  subnet_id      = module.vpc_b_subnet_public.subnet_id
  route_table_id = aws_route_table.vpcb_public_rt.id
}


