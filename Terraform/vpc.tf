resource "aws_vpc" "tekever" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "tekever"
  }
}

resource "aws_subnet" "tekever-pub-1" {
  vpc_id                  = aws_vpc.tekever.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "tekever-pub-1"
  }
}

resource "aws_subnet" "tekever-priv-1" {
  vpc_id                  = aws_vpc.tekever.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "tekever-priv-1"
  }
}

resource "aws_internet_gateway" "tekever-GW" {
  vpc_id = aws_vpc.tekever.id
  tags = {
    Name = "tekever-GW"
  }
}

resource "aws_route_table" "tekever-pub-RT" {
  vpc_id = aws_vpc.tekever.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tekever-GW.id
  }

  tags = {
    Name = "tekever-pub-RT"
  }
}

resource "aws_route_table_association" "tekever-pub-1" {
  subnet_id      = aws_subnet.tekever-pub-1.id
  route_table_id = aws_route_table.tekever-pub-RT.id
}