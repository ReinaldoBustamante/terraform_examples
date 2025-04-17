provider "aws" {
    profile = "student"
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"
    user_data = file("setup.sh")
    vpc_security_group_ids = [
        aws_security_group.ec2_sg.id
    ]

    tags = {
        Name = "ec2_instance"
        Creator = "reinaldo.bustamante026@gmail.com"
        Environment = "dev"
    }
}

resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "Security group for ec2 instance"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 80
    to_port = 80
    security_group_id = aws_security_group.ec2_sg.id
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "-1"
    security_group_id = aws_security_group.ec2_sg.id
}

output "public_ip" {
    description = "Public IP of EC2 instance"
    value = aws_instance.ec2_instance.public_ip
}

output "instance_name" {
  description = "Name of EC2 instance"
  value = aws_instance.ec2_instance.tags.Name
}