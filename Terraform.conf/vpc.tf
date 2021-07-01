
resource "aws_vpc" "main" {
  cidr_block = var.vpc-cidr
}

resource "aws_subnet" "main" {
  vpc_id = aws_vpc.main.id
  cidr_block = var.subnets-cidr
  availability_zone = var.aws-zone
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.gw.id
  }
}
