data "aws_iam_policy_document" "assume_role"{
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "SOAT_Cluster_Role"{
  count = var.create_iam_role ? 1 : 0
  name = "eks-cluster-8SOAT"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "SOAT-AmazonEKSClusterPolicy" {
  count = var.create_iam_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.SOAT_Cluster_Role[0].name  
}

resource "aws_iam_role_policy_attachment" "SOAT-AmazonEKSVPCResourceController" {
  count = var.create_iam_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role = aws_iam_role.SOAT_Cluster_Role[0].name
}