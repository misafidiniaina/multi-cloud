variable "aws_vpc_cidr" {
    description = "the cidr for aws vpc"
    type = string
}
variable "aws_public_subnets" { type = list(string) }
variable "aws_azs" { type = list(string) }
