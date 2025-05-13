resource "aws_iam_role" "ecs_task_role" {
  name               = "ecs_task_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Effect    = "Allow"
        Sid       = ""
      },
    ]
  })

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_ecs_cluster" "cvist-ecs-cluster" {
  name = var.ecs_cluster_name

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_ecs_task_definition" "cvist-ecs-task" {
  family                    = var.ecs_service_name
  network_mode              = "awsvpc"
  requires_compatibilities  = ["FARGATE"]
  cpu                       = var.cpu
  memory                    = var.memory

  container_definitions = jsonencode([{
    name      = var.container_name
    image     = var.container_image
    essential = true
    memory    = var.memory
    cpu       = var.cpu
    portMappings = [
      {
        containerPort = var.container_port
        hostPort      = var.container_port
        protocol      = "tcp"
      },
    ]
  }])

  task_role_arn = aws_iam_role.ecs_task_role.arn

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_ecs_service" "cvist-ecs-service" {
  name            = var.ecs_service_name
  cluster         = aws_ecs_cluster.cvist-ecs-cluster.id
  task_definition = aws_ecs_task_definition.cvist-ecs-task.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    security_groups = [var.security_group_id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = module.alb.target_group_arn  # Reference from ALB module
    container_name   = module.alb.container_name   # Reference from ALB module
    container_port   = var.container_port
  }

  depends_on = [module.alb.lb_listener_arn]  # Wait for ALB listener to be created first

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_appautoscaling_target" "cvist-autoscale-target" {
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  resource_id        = "service/${aws_ecs_cluster.cvist-ecs-cluster.name}/${aws_ecs_service.cvist-ecs-service.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_appautoscaling_policy" "cvist-autoscale-policy" {
  name                   = "cvist-autoscale-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  target_tracking_scaling_policy_configuration {
    target_value         = var.target_value
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
  }
  policy_type            = "TargetTrackingScaling"
  resource_id            = aws_appautoscaling_target.cvist-autoscale-target.resource_id
  scalable_dimension     = aws_appautoscaling_target.cvist-autoscale-target.scalable_dimension
  service_namespace      = aws_appautoscaling_target.cvist-autoscale-target.service_namespace

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

