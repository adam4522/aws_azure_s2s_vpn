#route table and routes created for public subnets to internet gw for vpc a

resource "aws_route_table" "vpc_a_publicrt" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_a_igw.id
  }

  route { #this route has been added to route to vpc B via the transit gw
    cidr_block = "172.16.0.0/26"
    transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  }

  tags = {
    Name = "vpc_a_publicrt"
  }
}

resource "aws_route_table_association" "vpc_a__public_az1" {
  subnet_id      = aws_subnet.vpc_a_subnet_public_AZ1.id
  route_table_id = aws_route_table.vpc_a_publicrt.id
}

resource "aws_route_table_association" "vpc_a__public_az2" {
  subnet_id      = aws_subnet.vpc_a_subnet_public_AZ2.id
  route_table_id = aws_route_table.vpc_a_publicrt.id
}

resource "aws_route_table_association" "vpc_a__public_az3" {
  subnet_id      = aws_subnet.vpc_a_subnet_public_AZ3.id
  route_table_id = aws_route_table.vpc_a_publicrt.id
}


#route table and routes created for private subnets to internet gw for vpc a

resource "aws_route_table" "vpc_a_privatert" {
  vpc_id = aws_vpc.vpc_a.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_vpc_a.id
  }

  route { #this route has been added to route to vpc B via the transit gw
    cidr_block = "172.16.0.0/26"
    transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  }

  tags = {
    Name = "vpc_a_privatert"
  }
}

resource "aws_route_table_association" "vpc_a__private_az1" {
  subnet_id      = aws_subnet.vpc_a_subnet_private_AZ1.id
  route_table_id = aws_route_table.vpc_a_privatert.id
}

resource "aws_route_table_association" "vpc_a__private_az2" {
  subnet_id      = aws_subnet.vpc_a_subnet_private_AZ2.id
  route_table_id = aws_route_table.vpc_a_privatert.id
}

resource "aws_route_table_association" "vpc_a__private_az3" {
  subnet_id      = aws_subnet.vpc_a_subnet_private_AZ3.id
  route_table_id = aws_route_table.vpc_a_privatert.id
}



#####################################################################

#route table for public vpc b subnet

resource "aws_route_table" "vpc_b_publicrt" {
  vpc_id = aws_vpc.vpc_b.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_b_igw.id
  }

  route { #this route has been added to route to vpc A via the transit gw
    cidr_block = "10.196.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  }


  tags = {
    Name = "vpc_b_publicrt"
  }
}

resource "aws_route_table_association" "vpc_b__public_az1" {
  subnet_id      = aws_subnet.vpc_b_subnet_public_AZ1.id
  route_table_id = aws_route_table.vpc_b_publicrt.id
}


#route table for private vpc b subnet

resource "aws_route_table" "vpc_b_privatert" {
  vpc_id = aws_vpc.vpc_b.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw_vpc_b.id
  }

  route { #this route has been added to route to vpc A via the transit gw
    cidr_block = "10.196.0.0/16"
    transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  }

  tags = {
    Name = "vpc_b_privatert"
  }
}

resource "aws_route_table_association" "vpc_b__private_az1" {
  subnet_id      = aws_subnet.vpc_b_subnet_private_AZ1.id
  route_table_id = aws_route_table.vpc_b_privatert.id
}