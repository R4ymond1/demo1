output "api_lb_tg_arn" {
  value = aws_lb_target_group.api_lb_tg.arn
}

output "api_lb_dns_name" {
  value = aws_lb.api_lb.dns_name
}
