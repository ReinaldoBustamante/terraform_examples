output "public_ip" {
    description = "Public IP of EC2 instance"
    value = aws_instance.ec2_instance.public_ip
}

output "instance_name" {
  description = "Name of EC2 instance"
  value = aws_instance.ec2_instance.tags.Name
}