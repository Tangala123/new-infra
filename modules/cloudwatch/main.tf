resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/${var.ecs_service_name}"
  retention_in_days = var.retention_in_days

  tags = var.tags
}