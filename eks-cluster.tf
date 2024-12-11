resource "aws_eks_cluster" "soat-cluster" {
  name = var.clusterName
  role_arn = data.aws_iam_role.labrole.arn

  vpc_config {
    subnet_ids         = [for subnet in data.aws_subnet.subnet : subnet.id if subnet.availability_zone != "${var.region}e"]
    security_group_ids = [aws_security_group.soat-sg.id]
  }

  access_config {
    authentication_mode                         = var.authMode
  }
}