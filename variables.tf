variable "region" {
  default = "us-east-1"
  type = string
  nullable = false
}

variable "authMode" {
  default = "API_AND_CONFIG_MAP"
  type = string
  nullable = false
}

variable "clusterName" {
  default = "soat-team"
  type = string
  nullable = false
}

variable "vpcCidr" {
  default = "172.31.0.0/16"
}

variable "instanceType" {
  default = "t3a.medium"
}

variable "accountIdVoclabs" {}

variable "policyArn" {
  default = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
}