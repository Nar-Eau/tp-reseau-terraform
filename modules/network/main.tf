resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id

  tags = {
    Name = "tp-${var.poste_nn}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id

  tags = {
    Name = "tp-${var.poste_nn}-rt-public"
  }
}

resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  subnet_id      = var.public_subnet_id
  route_table_id = aws_route_table.public.id
}

resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "tp-${var.poste_nn}-eip"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_nat_gateway" "this" {
  subnet_id     = var.public_subnet_id
  allocation_id = aws_eip.nat.id
  connectivity_type = "public"

  tags = {
    Name = "tp-${var.poste_nn}-nat"
  }

  depends_on = [aws_internet_gateway.this]
}

resource "aws_route_table" "prive" {
  vpc_id = var.vpc_id

  tags = {
    Name = "tp-${var.poste_nn}-rt-prive"
  }
}

resource "aws_route" "prive_default" {
  route_table_id         = aws_route_table.prive.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id          = aws_nat_gateway.this.id
}

resource "aws_route_table_association" "prive" {
  subnet_id      = var.prive_subnet_id
  route_table_id = aws_route_table.prive.id
}