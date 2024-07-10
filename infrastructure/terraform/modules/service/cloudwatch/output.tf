output "demo1_log_group_name" {
  value = aws_cloudwatch_log_group.demo1_log_group.name
}

output "demo1_log_group_arn" {
  value = aws_cloudwatch_log_group.demo1_log_group.arn
}
