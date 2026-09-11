resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tp-${var.poste_nn}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block               = "10.0.1.0/24"
  availability_zone        = "eu-west-3a"
  map_public_ip_on_launch  = true

  tags = {
    Name = "tp-${var.poste_nn}-public-a"
  }
}

resource "aws_subnet" "prive" {
  vpc_id                  = aws_vpc.this.id
  cidr_block               = "10.0.11.0/24"
  availability_zone        = "eu-west-3a"
  map_public_ip_on_launch  = false

  tags = {
    Name = "tp-${var.poste_nn}-prive-a"
  }
}