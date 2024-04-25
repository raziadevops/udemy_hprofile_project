resource "aws_iam_role" "eks_cluster_role" {
    name = "eks_cluster_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
  
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.eks_cluster_role.name
}
resource "aws_eks_cluster" "eks_cluster" {
    name = "eks_cluster"
    role_arn = aws_iam_role.eks_cluster_role.arn  
    vpc_config {
      subnet_ids = [
        aws_subnet.private_east_1a.id,
        aws_subnet.private_east_1b.id,
        aws_subnet.public_east_1a.id,
        aws_subnet.public_east_1b.id
      ]
      //endpoint_private_access = true
      //endpoint_public_access = false 
    }
    depends_on = [ 
      aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy 
      ]
}
