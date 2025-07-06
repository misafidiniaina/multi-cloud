# all variable DECLARATION here BEFORE setting value in the terraform.tfvars

variable "aws_region" {
  default = "us-east-1"
}

variable "aws_cluster_name" {
  description = "the name of the aws cluster"
  type = string
}

variable "aws_vpc_cidr" {
  description = "the cidr for the aws vpc"
  default = "10.0.0.0/16"
}

variable "aws_public_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "aws_azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}
