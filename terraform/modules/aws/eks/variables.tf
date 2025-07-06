variable "aws_cluster_name" {
    description = "the EKS cluster name"
    type        = string
}
variable "aws_subnet_ids" { type = list(string) }
variable "aws_cluster_role_arn" {
    description = "the IAM role ARN for the EKS cluster"
}
