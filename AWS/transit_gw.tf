resource "aws_ec2_transit_gateway" "main_tgw" {
  description = "main_tgw"
  default_route_table_propagation = "enable"

  tags = {Name = "main-main_tgw"}
}

resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_a_attatchment" {
  vpc_id             = aws_vpc.vpc_a.id
  subnet_ids         = [aws_subnet.vpc_a_subnet_private_AZ1.id, aws_subnet.vpc_a_subnet_private_AZ2.id, aws_subnet.vpc_a_subnet_private_AZ3.id]
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  tags = {
    Name = "vpc_a_attatchment"
  }
}


resource "aws_ec2_transit_gateway_vpc_attachment" "vpc_b_attatchment" {
  vpc_id             = aws_vpc.vpc_b.id
  subnet_ids         = [aws_subnet.vpc_b_subnet_private_AZ1.id]
  transit_gateway_id = aws_ec2_transit_gateway.main_tgw.id
  tags = {
    Name = "vpc_b_attatchment"
  }
}