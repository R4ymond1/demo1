resource "aws_ecs_cluster" "service_ecs_cluster" {
  name = "${var.resource_prefix}-ecs-cluster"
  tags = var.global_tags
}