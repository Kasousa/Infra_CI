resource "aws_lb" "alb" {
  name               = "ECS-Go"
  security_groups    = [aws_security_group.alb.id]
  subnets            = module.vpc.public_subnets
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alvo.arn
  }
}

resource "aws_lb_target_group" "alvo" {
  name        = "ECS-Go"
  port        = 8080
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = module.vpc.vpc_id
  health_check {
    path = "/leo"
  }
}

output "IP" {
  value = aws_lb.alb.dns_name
}
