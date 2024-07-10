resource "aws_ecr_repository" "demo1_repo" {
  name = "${var.resource_prefix}-demo1-repo"

  tags = var.global_tags
}
