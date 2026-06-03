# ============================================================
# Security Group cho Public EC2
# ============================================================
resource "aws_security_group" "public_ec2" {
  name        = ""
  description = "Allow SSH only from admin IP"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
    # cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-public-sg"
  }
}

# ============================================================
# Security Group cho Private EC2
# ============================================================
resource "aws_security_group" "private_ec2" {
  name        = ""
  description = "Allow SSH only from Public EC2 IP/SG"
  vpc_id      = var.vpc_id

  ingress {
    description     = "SSH from Public EC2 IP through/via Security Group"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_ec2.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-private-sg"
  }
}

