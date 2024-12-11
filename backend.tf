terraform {
  backend "s3" {
    bucket = "team-soat-bucket"
    key    = "fast-order/tf/app/terraform.tfstate"
    region = "us-east-1"
  }
}