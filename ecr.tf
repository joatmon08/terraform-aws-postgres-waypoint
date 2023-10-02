resource "aws_ecr_repository" "module" {
  name                 = var.business_unit
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}