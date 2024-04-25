resource "aws_internet_gateway" "igw_eks" {
    vpc_id = aws_vpc.vpc_eks.id

  tags = {
    Name = "igw_eks"
  }
  
  
}