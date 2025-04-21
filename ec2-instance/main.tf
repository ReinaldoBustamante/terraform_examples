resource "aws_instance" "ec2_instance" {
    ami = var.ami_id
    instance_type = var.instance_type
    user_data = file("scripts/${var.script_name}")
    vpc_security_group_ids = [
        aws_security_group.ec2_sg.id
    ]

    tags = {
        Name = var.instance_name
        Creator = var.creator
        Environment = var.environment
    }
}