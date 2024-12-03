terraform {
  required_providers {
    aws ={
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

module "eks_cluster" {
  source       = "./modules/eks_cluster"
  cluster_name = "8SOAT-Cluster"
  create_iam_role = true  
}

output "eks_endpoint" {
  value = module.eks_cluster.endpoint
}

output "eks_certificate_authority" {
  value = module.eks_cluster.kubeconfig_certificate_authority_data
}
