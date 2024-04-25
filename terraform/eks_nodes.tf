resource "aws_iam_role" "eks_nodes" {
    name = "eks-node-group-nodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}
resource "aws_iam_role_policy_attachment" "nodes-AmazonEKSWorkerNodePolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role       = aws_iam_role.eks_nodes.name
}
  
resource "aws_iam_role_policy_attachment" "nodes-AmazonEKS_CNI_Policy" {
    role    = aws_iam_role.eks_nodes.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}
resource "aws_iam_role_policy_attachment" "nodes-AmazonEC2ContainerRegistryReadOnly" {
    role    = aws_iam_role.eks_nodes.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
  
resource "aws_eks_node_group" "public-nodes" {
    cluster_name = aws_eks_cluster.eks_cluster.name
    node_group_name = "public-nodes"
    node_role_arn = aws_iam_role.eks_nodes.arn
    subnet_ids = [
        aws_subnet.public_east_1a.id,
        aws_subnet.public_east_1b.id
        ]
  
    capacity_type = "ON_DEMAND"
    instance_types = ["t3.small"]
  
    scaling_config {
        desired_size = 2
        max_size     = 3
        min_size     = 0
    }
  
    update_config {
        max_unavailable = 1
    }
  
    labels = {
        role = "general"
    }
  
    depends_on = [
        aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
        aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
    ]
  
}
