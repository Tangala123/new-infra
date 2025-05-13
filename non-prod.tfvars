vpc_id                         = "vpc-0d912a591fe34de43"
private_subnet_ids             = ["subnet-032a13bb29fa820f8", "subnet-061c033499fcc6ac2"]
security_group_id              = "sg-00c915e80a4c69af3"
transit_gateway_id             = "tgw-03c54433f67b2cab3"
transit_gateway_attachment_ids = ["tgw-attach-abc123", "tgw-attach-def456"]
route_table_ids                = ["rtb-07e4c49e97709917b", "rtb-0007c0d25c2f7ab46"]
ecr_repo_name                  = "cvist-ecr-repo"
ecs_cluster_name               = "cvist-ecs-cluster"
container_name                 = "cvist-ecr-container"
container_image                = "cvist-ecr-repo:latest"
ecs_service_name               = "cvist-ecs-service"
container_port                 = 8443
desired_count                  = 1
cpu                            = 256
memory                         = 512
tags = {
  Environment = "dev"
  Project     = "cvist"
  Owner       = "devops-team"
}

