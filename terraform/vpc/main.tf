resource "aws_vpc" "dev-vpc" {
  cidr_block       = var.cidr_blcok_vpc


  tags = {
    Name = var.vpc_tags
  }
}


resource "aws_subnet" "dev-public-subnet" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = var.cidr_blcok_subnet

  tags = {
    Name = var.subnet_tags
  }
}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev-routable" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }


  tags = {
    Name = "dev-public-routetable"
  }
}

resource "aws_route_table_association" "dev-routable-associate" {
  subnet_id      = aws_subnet.dev-public-subnet.id
  route_table_id = aws_route_table.dev-routable.id
}

