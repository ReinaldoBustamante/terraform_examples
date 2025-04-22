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

module "s3-bucket1" {
  source = "./s3-bucket"
  isPublic = true
}

output "ip-1" {
  value = module.ec2-instance-module.public_ip
}

output "ip-2" {
  value = module.ec2-instance-module2.public_ip
}

output "url_resource_s3" {
  value = module.s3-bucket1.url_resource
}