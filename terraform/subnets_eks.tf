resource "aws_subnet" "private_east_1a" {
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = "10.100.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    "Name"                            = "private_east_1a"
   // "kubernetes.io/role/internal-elb" = "1"
   // "kubernetes.io/cluster/demo"      = "owned"
  }
}
resource "aws_subnet" "private_east_1b" {
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = "10.100.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    "Name"                            = "private_east_1b"
   // "kubernetes.io/role/internal-elb" = "1"
   // "kubernetes.io/cluster/demo"      = "owned"
  }
}
resource "aws_subnet" "public_east_1a"{
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = "10.100.2.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name"                            = "public_east_1a"
    "kubernetes.io/role/elb"          = "1"
   // "kubernetes.io/cluster/eks_cluster"      = "owned"
  }
}
resource "aws_subnet" "public_east_1b"{
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = "10.100.3.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true
  
  tags = {
    "Name"                            = "public_east_1b"
   // "kubernetes.io/role/elb"          = "1"
   // "kubernetes.io/cluster/eks_cluster"      = "owned"
  }
}
  
