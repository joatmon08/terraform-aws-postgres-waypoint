resource "aws_ecr_repository" "module" {
  name                 = var.business_unit
  image_tag_mutability = "MUTABLE"
  force_delete         = true

  image_scanning_configuration {
    scan_on_push = false
  }
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "module" {
  statement {
    sid    = "ECR"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }

    actions = [
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:GetRepositoryPolicy",
      "ecr:ListImages",
      "ecr:DeleteRepository",
      "ecr:BatchDeleteImage",
      "ecr:SetRepositoryPolicy",
      "ecr:DeleteRepositoryPolicy",
    ]
  }
}

resource "aws_ecr_repository_policy" "module" {
  repository = aws_ecr_repository.module.name
  policy     = data.aws_iam_policy_document.module.json
}