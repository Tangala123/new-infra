resource "aws_lb" "alb-main" {
  name               = var.alb_name
  internal           = true
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = var.subnet_ids
  ip_address_type    = "ipv4"

  tags = var.tags
}

resource "aws_lb_target_group" "alb-tg" {
  name     = "${var.alb_name}-tg"
  port     = 8443
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  target_type = "ip"

  health_check {
    path                = "/cvist/start"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = var.tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb-main.arn
  port              = 8443
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }

  tags = var.tags
}
