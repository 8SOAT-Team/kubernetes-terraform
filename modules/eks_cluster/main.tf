resource "aws_eks_cluster" "SOAT_Cluster" {
  name     = var.cluster_name
  role_arn = var.create_iam_role ? aws_iam_role.SOAT_Cluster_Role[0].arn : var.role_arn

  vpc_config {
    subnet_ids = [aws_subnet.SOAT_Cluster_1.id, aws_subnet.SOAT_Cluster_2.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.SOAT-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.SOAT-AmazonEKSVPCResourceController,
  ]
}

output "endpoint" {
  value = aws_eks_cluster.SOAT_Cluster.endpoint
}

output "kubeconfig_certificate_authority_data" {
  value = aws_eks_cluster.SOAT_Cluster.certificate_authority[0].data
}
