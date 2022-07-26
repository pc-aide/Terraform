#############################################################################
# DATA
############################################################################

############################################################################
# RESOURCES
############################################################################

# load balancer
resource "aws_lb" "alb-nginx" {
  name               = "alb-nginx"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false

  # logging in futur in a s3

  tags = local.common_tags
}

# alb_target_group
resource "aws_lb_target_group" "alb-tg" {
  name     = "alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id
}

# alb-listenner
resource "aws_lb_listener" "alb-listenner" {
  load_balancer_arn = aws_lb.alb-nginx.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }

  tags = local.common_tags
}

# alb-tg attachment (instances or asg in futur ?)
resource "aws_lb_target_group_attachment" "alb-tg-attachment" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.alb-tg.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 80
}
