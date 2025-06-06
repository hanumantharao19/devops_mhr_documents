
provider "aws" {
  region = var.region
}
resource "aws_vpc" "vpc" {
  cidr_block           = "192.162.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "mhr-dev-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "mhr-dev-igw" 
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.162.1.0/24"

  tags = {
    Name = "mhr-dev-subnet"
  }
}


resource "aws_route_table" "route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "mhr-dev-route-table" 
  }
}

resource "aws_route_table_association" "route-associate" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.route-table.id
}
