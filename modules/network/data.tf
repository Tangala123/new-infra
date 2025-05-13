# Reference the existing VPC
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Reference the existing subnets
data "aws_subnet" "private" {
  for_each = toset(var.private_subnet_ids)
  id       = each.value
}

# Reference the existing security group
data "aws_security_group" "selected" {
  id = var.security_group_id
}

# Reference the existing Transit Gateway
data "aws_ec2_transit_gateway" "selected" {
  id = var.transit_gateway_id
}

# Reference the existing route tables
data "aws_route_table" "selected" {
  for_each = toset(var.route_table_ids)
  id       = each.value
}


