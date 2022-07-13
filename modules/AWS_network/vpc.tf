resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr_block_vpc
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_block

  availability_zone = var.availability_zones
  tags = {
    Name = var.subnet_name
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  subnet_id = aws_subnet.my_subnet.id
  connectivity_type = "private"
  tags = {
    Name = var.nat
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "my_route_table"
  }
}


resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}


output "mysubnet_id" {
  value = aws_subnet.my_subnet.id
}

