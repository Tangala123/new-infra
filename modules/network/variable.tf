variable "vpc_id" {
  description = "The ID of the existing VPC"
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "security_group_id" {
  description = "The ID of the existing security group"
  type        = string
}

variable "transit_gateway_id" {
  description = "The ID of the existing Transit Gateway"
  type        = string
}

variable "transit_gateway_attachment_ids" {
  description = "List of Transit Gateway Attachment IDs"
  type        = list(string)
}

variable "route_table_ids" {
  description = "List of route table IDs"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
}