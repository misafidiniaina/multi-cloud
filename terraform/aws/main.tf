provider "aws" {
  region = var.region
}

module "vpc" {
  source         = "../modules/aws/network"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  azs            = var.azs
}

module "iam" {
  source = "../modules/aws/iam"
}

module "eks" {
  source           = "../modules/aws/eks"
  cluster_name     = var.cluster_name
  subnet_ids       = module.vpc.subnet_ids
  cluster_role_arn = module.iam.cluster_role_arn
}
