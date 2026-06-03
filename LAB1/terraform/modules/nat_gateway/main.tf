# ============================================================
# NAT Gateway
# ============================================================
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnet_id

  tags = {
    Name = "${var.project_name}-nat-gateway"
  }
  # depends_on = [aws_internet_gateway.igw]
}

