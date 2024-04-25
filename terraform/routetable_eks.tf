resource "aws_route_table" "public_route_table_eks" {
    vpc_id = aws_vpc.vpc_eks.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_eks.id
  }

  tags = {
    Name = "public_route_table_eks"
  }
  depends_on = [ aws_internet_gateway.igw_eks ]
}
resource "aws_route_table_association" "public_route_table_eks_association_1a" {
    subnet_id =aws_subnet.public_east_1a.id
    route_table_id = aws_route_table.public_route_table_eks.id
}
resource "aws_route_table_association" "public_route_table_eks_association_1b" {
    subnet_id =aws_subnet.public_east_1b.id
    route_table_id = aws_route_table.public_route_table_eks.id
}

