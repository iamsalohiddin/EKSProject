resource "aws_launch_template" "ProjectLT" {
  name = "ProjectLT"
  key_name = "EKSCluster"
  image_id = var.ami_image
  instance_type = var.instance_type
  security_group_names = aws_security_group.EKS.name
  block_device_mappings {
    device_name = "/dev/xvdb"
    ebs {
      volume_size = "20"
      volume_type = "gp2"
    }
  }
}
resource "aws_eks_cluster" "ProjectEKS" {
  name = "ProjectEKS"
  role_arn = aws_iam_role.example.arn
  vpc_config {
    subnet_ids = aws_subnet.private[*].id
  }
  depends_on = [ aws_iam_role_policy_attachment.example-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.example-AmazonEKSVPCResourceController ]
}

resource "aws_eks_node_group" "EKS_Node_Group" {
  cluster_name = aws_eks_cluster.ProjectEKS.name
  node_group_name = "EKS Group"
  node_role_arn = aws_iam_role.example.arn
  subnet_ids = [ aws_subnet.private.*.id, count.index ]
  scaling_config {
    desired_size = 1
    min_size = 0
    max_size = 10
  }
  update_config {
    max_unavailable = 1
  }
  launch_template {
    name = aws_launch_template.ProjectLT.name
    version = aws_launch_template.ProjectLT.latest_version
  }
  depends_on = [ aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly ]
}