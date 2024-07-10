resource "aws_ecs_task_definition" "demo1_task_def" {
  family = "${var.resource_prefix}-demo1-task-def-${formatdate("DDMMYYYY-hhmm", timestamp())}"

  task_role_arn      = var.ecs_task_role_arn
  execution_role_arn = var.ecs_task_role_arn

  network_mode             = "awsvpc"
  requires_compatibilities = [
    "FARGATE"
  ]

  cpu                   = var.demo1_cpu
  memory                = var.demo1_memory
  container_definitions = data.template_file.demo1_container_config.rendered

  tags = var.global_tags

}

data "template_file" "demo1_container_config" {
  template = file("${path.module}/container_config/demo1.json.tpl")

  vars = {
    resource_prefix          = var.resource_prefix
    image_url                = "${var.demo1_repo_url}:latest"
    log_group                = var.demo1_log_group_name
    aws_region               = var.aws_region
#     api_lb_dns_name          = var.api_lb_dns_name
    cpu                      = var.demo1_cpu
    memory                   = var.demo1_memory
    service_port             = var.demo1_service_port
  }
}

resource "aws_ecs_service" "demo1_service" {
  name            = "${var.resource_prefix}-demo1-service"
  task_definition = aws_ecs_task_definition.demo1_task_def.arn
  desired_count   = var.demo1_desired_count
  launch_type     = "FARGATE"
  cluster         = aws_ecs_cluster.service_ecs_cluster.id

  force_new_deployment = true

  network_configuration {
    security_groups = [
      var.public_vpc_sg_id
    ]
#     subnets          = var.public_vpc_public_subnets_ids
    subnets = ["subnet-07a000a4f0978b22a","subnet-09d6f2f5d4e853638"]
    assign_public_ip = true

  }
}
