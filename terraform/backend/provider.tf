terraform {
  backend "s3" {
    bucket = "team-soat-bucket"
    key    = "fast-order/tf/backend/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}