resource "aws_security_group" "ec2_sg" {
    name = "${var.instance_name}-sg"
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