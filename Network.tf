#Network infrastructure components

#Creating the VPC
resource "aws_vpc" "vpc_kevin_challenge1" {
  cidr_block  = var.vpc_cidr

  tags = {
    Name = "Challenge1-Terraform"
  }
}

#Public Subnet 
resource "aws_subnet" "subnet_kevin_public" {
  vpc_id     = aws_vpc.vpc_kevin_challenge1.id
  cidr_block = var.cidr_public_subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "SubnetPublic"
  }
}

#Private Subnet 
resource "aws_subnet" "subnet_kevin_private" {
  vpc_id     = aws_vpc.vpc_kevin_challenge1.id
  cidr_block = var.cidr_private_subnet

  tags = {
    Name = "SubnetPrivate"
  }
}


#Internal Gateway 
resource "aws_internet_gateway" "igw_kevin_challenge1" {
  vpc_id = aws_vpc.vpc_kevin_challenge1.id

  tags = {
    Name = "Challenge1-Terraform-igw"
  }
}


#Route Table
resource "aws_route_table" "rtable_kevin_challenge1" {
  vpc_id = aws_vpc.vpc_kevin_challenge1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_kevin_challenge1.id
  }

  tags = {
    Name = "PublicRouteTable"
  }
}


#Route Table associtation with the public subnet
resource "aws_route_table_association" "association_public" {
  subnet_id = aws_subnet.subnet_kevin_public.id
  route_table_id = aws_route_table.rtable_kevin_challenge1.id
}