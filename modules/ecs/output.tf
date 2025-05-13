output "ecs_cluster_id" {
  value       = aws_ecs_cluster.cvist-ecs-cluster.id
  description = "The ID of the ECS cluster"
}

output "ecs_service_name" {
  value       = aws_ecs_service.cvist-ecs-service.name
  description = "The name of the ECS service"
}

output "ecs_task_definition_arn" {
  value       = aws_ecs_task_definition.cvist-ecs-task.arn
  description = "The ARN of the ECS task definition"
}

output "autoscaling_policy_arn" {
  value       = aws_appautoscaling_policy.cvist-autoscale-policy.arn
  description = "The ARN of the ECS autoscaling policy"
}