#=https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc---to create a vpc
#this code is to create a vpc the resource block tell us the resource we are creating and the resource name
resource "aws_vpc" "prime-vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "prime-vpc"
  }
}

# https://registry.terraform.io/providers/aaronfeng/aws/latest/docs/resources/internet_gateway- this is to create an internet gateway
resource "aws_internet_gateway" "prime-igw" {
  vpc_id = aws_vpc.prime-vpc.id

  tags = {
    Name = "prime-igw"
  }
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet.html--this create a public subnet
resource "aws_subnet" "prime-pub1" {
  vpc_id            = aws_vpc.prime-vpc.id
  cidr_block        = var.prime-pub1-cidr
  availability_zone = "var.prime_pub1-az"

  tags = {
    Name = "prime-pub1"
  }
}
#creation of public subnet 2
resource "aws_subnet" "prime-pub2" {
  vpc_id            = aws_vpc.prime-vpc.id
  cidr_block        = var.prime-pub2-cidr
  availability_zone = "var.prime_pub2-az"

  tags = {
    Name = "prime-pub2"
  }
}

#creating a route table
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table

resource "aws_route_table" "prime-pub-route-table" {
  vpc_id = aws_vpc.prime-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prime-igw.id
  }

  tags = {
    Name = "prime-pub-route_table"
  }
}

# associating subnet 1

resource "aws_route_table_association" "prime-pub1" {
  subnet_id      = aws_subnet.prime-pub1.id
  route_table_id = aws_route_table.prime-pub-route-table.id
}

# associating subnet 2

resource "aws_route_table_association" "prime-pub2" {
  subnet_id      = aws_subnet.prime-pub2.id
  route_table_id = aws_route_table.prime-pub-route-table.id
}

#creating a 2private subnet--home work--
resource "aws_subnet" "prime-private1" {
  vpc_id            = aws_vpc.prime-vpc.id
  cidr_block        = var.prime-private1-cidr
  availability_zone = "prime-private-az"

  tags = {
    Name = "prime-private1"
  }
}

resource "aws_subnet" "prime-private2" {
  vpc_id            = aws_vpc.prime-vpc.id
  cidr_block        = var.prime-private2-cidr
  availability_zone = "prime-private-az"

  tags = {
    Name = "prime-private2"
  }
}

#creating a private route table
resource "aws_route_table" "prime-private" {
  vpc_id = aws_vpc.prime-vpc.id

  route = []

  tags = {
    Name = "prime-private-route-table"
  }
}

#associating my route table to subnet

resource "aws_route_table_association" "prime-private1" {
  subnet_id      = aws_subnet.prime-private1.id
  route_table_id = aws_route_table.prime-private.id
}

resource "aws_route_table_association" "prime-private2" {
  subnet_id      = aws_subnet.prime-private2.id
  route_table_id = aws_route_table.prime-private.id
}


