provider "aws" {
    profile = "student"
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-00a929b66ed6e0de6"
    instance_type = "t2.micro"

    tags = {
        Name = "ec2_instance"
        Creator = "reinaldo.bustamante026@gmail.com"
        Environment = "dev"
    }
}

output "public_ip" {
    description = "Public IP of EC2 instance"
    value = aws_instance.ec2_instance.public_ip
}

output "instance_name" {
  description = "Name of EC2 instance"
  value = aws_instance.ec2_instance.tags.Name
}