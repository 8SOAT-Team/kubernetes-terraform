resource "aws_eks_node_group" "node-group" {
  cluster_name = aws_eks_cluster.soat-cluster.name
  node_group_name = "NG-${var.clusterName}"
  node_role_arn = data.aws_iam_role.labrole.arn
  subnet_ids = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.region}e"]
  instance_types = [var.instanceType]
  disk_size = 50
  
  scaling_config {
    desired_size = 1
    max_size = 2
    min_size = 1
  }

  update_config {
    max_unavailable = 1
  }
}