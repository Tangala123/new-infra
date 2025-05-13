module "network" {
  source                         = "./modules/network"
  vpc_id                         = var.vpc_id
  private_subnet_ids             = var.private_subnet_ids
  security_group_id              = var.security_group_id
  transit_gateway_id             = var.transit_gateway_id
  transit_gateway_attachment_ids = var.transit_gateway_attachment_ids
  route_table_ids                = var.route_table_ids
  tags                           = var.tags
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  security_group_id = module.network.security_group_id
  subnet_ids        = module.network.private_subnet_ids
  vpc_id            = var.vpc_id
  tags              = var.tags
}

module "ecr" {
  source        = "./modules/ecr"
  ecr_repo_name = var.ecr_repo_name
  kms_key_id    = var.kms_key_id
  tags          = var.tags
}

module "ecs" {
  source = "./modules/ecs"

  ecs_cluster_name   = var.ecs_cluster_name
  ecs_service_name   = var.ecs_service_name
  container_name     = var.container_name
  container_image    = var.container_image
  cpu                = var.cpu
  memory             = var.memory
  container_port     = var.container_port
  desired_count      = var.desired_count
  subnet_ids         = module.network.private_subnet_ids
  security_group_id  = module.network.security_group_id
  max_capacity       = var.max_capacity
  min_capacity       = var.min_capacity
  target_value       = var.target_value

  target_group_arn   = module.alb.target_group_arn
  lb_listener_arn    = module.alb.lb_listener_arn    
  kms_key_id         = var.kms_key_id                

  tags               = var.tags
}


module "cloudwatch" {
  source            = "./modules/cloudwatch"
  ecs_service_name  = var.ecs_service_name
  retention_in_days = var.retention_in_days
  tags              = var.tags
}