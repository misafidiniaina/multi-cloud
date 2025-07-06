resource "aws_vpc" "this" {
  cidr_block = var.aws_vpc_cidr
}

resource "aws_subnet" "public" {
  count             = length(var.aws_public_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.aws_public_subnets, count.index)
  availability_zone = element(var.aws_azs, count.index)
}

