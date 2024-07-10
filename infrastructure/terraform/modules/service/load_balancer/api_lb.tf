resource "aws_lb" "api_lb" {
  name               = "${var.resource_prefix}-api-lb"
  load_balancer_type = "application"
  internal           = false
  subnets            = var.public_vpc_public_subnets_ids
}

resource "aws_lb_target_group" "api_lb_tg" {
  name        = "${var.resource_prefix}-api-lb-tg"
  port        = var.api_service_port
  protocol    = "HTTP"
  vpc_id      = var.public_vpc_id
  target_type = "ip"

  depends_on = [
    aws_lb.api_lb
  ]
}

resource "aws_lb_listener" "api_lb_listener" {
  load_balancer_arn = aws_lb.api_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.api_lb_tg.id
    type             = "forward"
  }
}