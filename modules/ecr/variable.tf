variable "ecr_repo_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "kms_key_id" {
  description = "The KMS key ID for encryption"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}