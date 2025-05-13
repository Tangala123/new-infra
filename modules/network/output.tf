output "vpc_id" {
  value = data.aws_vpc.selected.id
}

output "private_subnet_ids" {
  value = [for s in data.aws_subnet.private : s.id]
}

output "security_group_id" {
  value = data.aws_security_group.selected.id
}

output "transit_gateway_id" {
  value = data.aws_ec2_transit_gateway.selected.id
}

output "route_table_ids" {
  value = [for r in data.aws_route_table.selected : r.id]
}
