output "ecs_cluster_name" {
  value = aws_ecs_cluster.service_ecs_cluster.name
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.service_ecs_cluster.arn
}


output "demo1_service_name" {
  value = aws_ecs_service.demo1_service.name
}

