#security group for vpc a public instances
resource "aws_security_group" "vpc_a_public_instance_sg" {
  name        = "vpc_a_public_instance_sg"
  description = "vpc_a_public_instance_sg"
  vpc_id      = aws_vpc.vpc_a.id

ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "vpc_a_public_instance_sg"
  }
}

#security group for vpc b public instances
resource "aws_security_group" "vpc_b_public_instance_sg" {
  name        = "vpc_b_public_instance_sg"
  description = "vpc_b_public_instance_sg"
  vpc_id      = aws_vpc.vpc_b.id

ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "vpc_b_public_instance_sg"
  }
}



