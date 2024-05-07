resource "aws_subnet" "private_east_1a" {
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = var.subnet_cidrs[0]
  availability_zone = var.zones[0]

  tags = {
    "Name"                            = "private_east_1a"
   // "kubernetes.io/role/internal-elb" = "1"
   // "kubernetes.io/cluster/demo"      = "owned"
  }
}
resource "aws_subnet" "private_east_1b" {
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = var.subnet_cidrs[1]
  availability_zone = var.zones[1]

  tags = {
    "Name"                            = "private_east_1b"
   // "kubernetes.io/role/internal-elb" = "1"
   // "kubernetes.io/cluster/eks_cluster"      = "owned"
  }
}
resource "aws_subnet" "public_east_1a"{
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = var.subnet_cidrs[2]
  availability_zone = var.zones[0]
  map_public_ip_on_launch = true

  tags = {
    "Name"                            = "public_east_1a"
    "kubernetes.io/role/elb"          = "1"
   // "kubernetes.io/cluster/eks_cluster"      = "owned"
  }
}
resource "aws_subnet" "public_east_1b"{
    vpc_id            = aws_vpc.vpc_eks.id
  cidr_block        = var.subnet_cidrs[3]
  availability_zone = var.zones[1]
  map_public_ip_on_launch = true
  
  tags = {
    "Name"                            = "public_east_1b"
   // "kubernetes.io/role/elb"          = "1"
   // "kubernetes.io/cluster/eks_cluster"      = "owned"
  }
}
  
