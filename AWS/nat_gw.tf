resource "aws_eip" "eip_nat_vpc_a" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_vpc_a" {
    allocation_id = aws_eip.eip_nat_vpc_a.id
    subnet_id = aws_subnet.vpc_a_subnet_public_AZ1.id

    tags = {
        Name = "nat_gw_vpc_a"
        }
}


##############################################################


resource "aws_eip" "eip_nat_vpc_b" {
    domain = "vpc"
}

resource "aws_nat_gateway" "nat_gw_vpc_b" {
    allocation_id = aws_eip.eip_nat_vpc_b.id
    subnet_id = aws_subnet.vpc_b_subnet_public_AZ1.id

    tags = {
        Name = "nat_gw_vpc_b"
        }
}