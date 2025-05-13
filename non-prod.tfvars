# The ID of the VPC where resources will be deployed
vpc_id = "vpc-0d912a591fe34de43"

# List of private subnet IDs for ECS and other resources
private_subnet_ids = ["subnet-032a13bb29fa820f8", "subnet-061c033499fcc6ac2"]

# Security group ID for ECS and ALB
security_group_id = "sg-00c915e80a4c69af3"

# Transit Gateway ID and its attachment IDs
transit_gateway_id             = "tgw-03c54433f67b2cab3"
transit_gateway_attachment_ids = ["tgw-attach-abc123", "tgw-attach-def456"]

# Route table IDs for the subnets
route_table_ids = ["rtb-07e4c49e97709917b", "rtb-0007c0d25c2f7ab46"]

# ECR repository name
ecr_repo_name = "cvist-ecr-repo"

# KMS Key ID for encryption
kms_key_id = "arn:aws:kms:region:account-id:key/key-id"

# ECS cluster and service configuration
ecs_cluster_name = "cvist-ecs-cluster"
ecs_service_name = "cvist-ecs-service"
container_name   = "cvist-ecr-container"
container_image  = "cvist-ecr-repo:latest"
container_port   = 8443
desired_count    = 1
cpu              = 256
memory           = 512
max_capacity     = 10
min_capacity     = 1
target_value     = 50
environment      = "non-prod"
project_name     = "my-project"

# Tags to apply to all resources
tags = {
  Environment = "Non-Production"
  Owner       = "DevOps"
  Project     = "Terraform-CVIST"
}