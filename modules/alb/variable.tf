variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for the ALB"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID where the target group will be created"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

# variable "certificate_arn" {
#   description = "ARN of the SSL certificate for HTTPS listener"
#   type        = string
#   default     = "" # Optional, if HTTPS is not used
# }

