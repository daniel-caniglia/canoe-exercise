output "cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "service_name" {
  value = aws_ecs_service.hello_world.name
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.hello_world.arn
}
