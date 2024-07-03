resource "aws_instance" "vpc_a_instance" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.vpc_a_subnet_public_AZ1.id
    vpc_security_group_ids = [aws_security_group.vpc_a_public_instance_sg.id]
    #user_data = file("bootstrap_apache_maria.sh")
    iam_instance_profile = "CWAgent_ssm_role"
    tags = {
    Name = "vpc_a_instance"
    OS = "linux"
  }
} 

resource "aws_instance" "vpc_b_instance" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.vpc_b_subnet_public_AZ1.id
    vpc_security_group_ids = [aws_security_group.vpc_b_public_instance_sg.id]
    #user_data = file("bootstrap_apache_maria.sh")
    iam_instance_profile = "CWAgent_ssm_role"
    tags = {
    Name = "vpc_b_instance"
    OS = "linux"
  }
} 


resource "aws_instance" "vpc_a_instance_private" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.vpc_a_subnet_private_AZ1.id
    vpc_security_group_ids = [aws_security_group.vpc_a_public_instance_sg.id]
    associate_public_ip_address = "false"
    #user_data = file("bootstrap_apache_maria.sh")
    iam_instance_profile = "CWAgent_ssm_role"
    tags = {
    Name = "vpc_a_instance_private"
    OS = "linux"
  }
} 


resource "aws_instance" "vpc_b_instance_private" {
    ami = "ami-06c68f701d8090592"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.vpc_b_subnet_private_AZ1.id
    vpc_security_group_ids = [aws_security_group.vpc_b_public_instance_sg.id]
    associate_public_ip_address = "false"
    #user_data = file("bootstrap_apache_maria.sh")
    iam_instance_profile = "CWAgent_ssm_role"
    tags = {
    Name = "vpc_b_instance_private"
    OS = "linux"
  }
} 
