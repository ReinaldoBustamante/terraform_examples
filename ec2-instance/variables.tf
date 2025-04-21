variable "ami_id" {
  type = string
  default = "ami-00a929b66ed6e0de6"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "environment" {
  type = string
  default = "dev"
}

variable "instance_name" {
  type = string
  default = "ec2_instance"
}

variable "creator" {
  type = string
  default = "reinaldo.bustamante026@gmail.com"
}

variable "script_name" {
  type = string
  default = "setup-nginx.sh"
}

variable "profile" {
  type = string
  default = "student"
}

variable "region" {
  type = string
  default = "us-east-1"
}