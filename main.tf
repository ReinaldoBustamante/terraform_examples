module "ec2-instance-module" {
  source = "./ec2-instance"
  instance_name = "instance 1"
  environment = "Production"
}

module "ec2-instance-module2" {
  source = "./ec2-instance"
  instance_name = "Instance 2"
  environment = "developer"
}

output "ip-1" {
  value = module.ec2-instance-module.public_ip
}

output "ip-2" {
  value = module.ec2-instance-module2.public_ip
}