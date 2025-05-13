output "ecs_cluster_id" {
  value = aws_ecs_cluster.cvist-ecs-cluster.id
}

output "ecs_service_name" {
  value = aws_ecs_service.cvist-ecs-service.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.cvist-ecs-task.arn
}

output "autoscaling_policy_arn" {
  value = aws_appautoscaling_policy.cvist-autoscale-policy.arn
}
