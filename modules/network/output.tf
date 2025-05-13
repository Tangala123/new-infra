output "vpc_cidr_block" {
  value       = data.aws_vpc.selected.cidr_block
  description = "The CIDR block of the selected VPC"
}

output "private_subnet_ids" {
  value = [for subnet in data.aws_subnet.private : subnet.id]
  description = "List of private subnet IDs"
}

output "security_group_id" {
  value       = data.aws_security_group.selected.id
  description = "The ID of the selected security group"
}

output "transit_gateway_arn" {
  value       = data.aws_ec2_transit_gateway.selected.arn
  description = "The ARN of the selected Transit Gateway"
}

output "route_table_ids" {
  value       = data.aws_route_table.selected.*.id
  description = "The IDs of the selected route tables"
}