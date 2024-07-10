resource "aws_cloudwatch_log_group" "demo1_log_group" {
  name = "/ecs/${var.resource_prefix}-demo1-log"
}
