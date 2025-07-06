resource "aws_eks_cluster" "this" {
  name     = var.aws_cluster_name
  role_arn = var.aws_cluster_role_arn

  vpc_config {
    subnet_ids = var.aws_subnet_ids
  }

  depends_on = [var.aws_cluster_role_arn]
}

