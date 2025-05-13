resource "aws_ecr_repository" "cvist-ecr-repo" {
  name                 = var.ecr_repo_name
  image_tag_mutability = "IMMUTABLE"
  encryption_configuration {
    encryption_type = "KMS"
    kms_key         = var.kms_key_id
  }

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}
