resource "aws_vpc" "vpc_eks" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "vpc_eks"
  }
}