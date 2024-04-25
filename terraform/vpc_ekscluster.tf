resource "aws_vpc" "vpc_eks" {
  cidr_block = "10.100.0.0/20"
  tags = {
    Name = "vpc_eks"
  }
}