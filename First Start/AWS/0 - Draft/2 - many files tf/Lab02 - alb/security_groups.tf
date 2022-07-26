# alb-sg
resource "aws_security_group" "alb-sg" {
  name   = "alb-sg"
  vpc_id = module.vpc.vpc_id

  # Inbound rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP any where"
  }

  # Oubount rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all oubound"
  }
  tags = local.common_tags
}

# nginx-sg
resource "aws_security_group" "nginx-sg" {
  name   = "nginx-sg"
  vpc_id = module.vpc.vpc_id

  # Inbound
  # Allow HTTP from alb-sg
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb-sg.id]
    description     = "Allow HTTP from alb-sg"
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outbound internet access"
  }

  tags = local.common_tags
}
