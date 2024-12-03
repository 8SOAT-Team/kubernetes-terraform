resource "aws_subnet" "SOAT_Cluster_1" {
  vpc_id                  = aws_vpc.SOAT_VPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  depends_on = [ aws_vpc.SOAT_VPC ]
}

resource "aws_subnet" "SOAT_Cluster_2" {
  vpc_id                  = aws_vpc.SOAT_VPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  depends_on = [ aws_vpc.SOAT_VPC ]
}


resource "aws_vpc" "SOAT_VPC" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "SOAT-VPC"
  }
}
