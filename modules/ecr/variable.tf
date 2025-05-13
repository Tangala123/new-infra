variable "ecr_repo_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "kms_key_id" {
  description = "KMS key ID used for image encryption"
  type        = string
}
