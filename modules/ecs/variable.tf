variable "ecs_cluster_name" {
  description = "The name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "container_image" {
  description = "The image URI for the ECS container"
  type        = string
}

variable "cpu" {
  description = "The amount of CPU to allocate to the task"
  type        = string
  default     = "256"
}

variable "memory" {
  description = "The amount of memory to allocate to the task"
  type        = string
  default     = "512"
}

variable "container_port" {
  description = "The port the container will listen on"
  type        = number
  default     = 8443
}

variable "desired_count" {
  description = "The desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "The security group ID for ECS service"
  type        = string
}

variable "max_capacity" {
  description = "Maximum capacity for autoscaling"
  type        = number
  default     = 10
}

variable "min_capacity" {
  description = "Minimum capacity for autoscaling"
  type        = number
  default     = 1
}

variable "target_value" {
  description = "Target value for autoscaling based on CPU utilization"
  type        = number
  default     = 50
}

variable "target_group_arn" {
  description = "ARN of the ALB Target Group"
  type        = string
}

variable "tags" {
  description = "Common tags for all resources"
  type        = map(string)
}

variable "kms_key_id" {
  description = "The KMS key ID for encryption"
  type        = string
}

# variable "environment" {
#   description = "The environment in which the resources are deployed (e.g., production, staging)"
#   type        = string
# }

# variable "project_name" {
#   description = "The name of the project or application"
#   type        = string
# }


variable "lb_listener_arn" {
  description = "The ARN of the ALB Listener"
  type        = string
}
