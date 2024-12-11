#libera usuário para logar via cli no cluster
resource "aws_eks_access_entry" "access-entry" {
  cluster_name      = aws_eks_cluster.soat-cluster.name
  principal_arn     = "arn:aws:iam::400855212252:role/voclabs"
  kubernetes_groups = ["soat"]
  type              = "STANDARD"
}