module "vpc" {
  source         = "../../../modules/aws/network"
  aws_vpc_cidr       = var.aws_vpc_cidr
  aws_public_subnets = var.aws_public_subnets
  aws_azs            = var.aws_azs
}

module "iam" {
  source = "../../../modules/aws/iam"
}

module "eks" {
  source           = "../../../modules/aws/eks"
  aws_cluster_name     = var.aws_cluster_name
  aws_subnet_ids       = module.vpc.subnet_ids
  aws_cluster_role_arn = module.iam.cluster_role_arn
}
