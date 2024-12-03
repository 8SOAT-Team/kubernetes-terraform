variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
}

variable "role_arn" {
  description = "ARN da role para o cluster"
  type        = string
  default = null
}

variable "depends_on_resources" {
  description = "Dependências para o cluster"
  type        = list(any)
  default     = []
}

variable "create_iam_role" {
  description = "Flag para criar IAM roles automaticamente"
  type        = bool
  default     = true
}
