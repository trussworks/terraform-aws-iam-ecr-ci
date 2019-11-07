/**
 * Creates an IAM user/group for CI to use to push images to ECR.
 *
 * Creates the following resources:
 *
 * * IAM user, group, and policy.
 *
 * ## Usage
 *
 * ```hcl
 * module "ecr_ci_myapp" {
 *  source = "trussworks/iam-ecr-ci/aws"
 *
 *  ecr_repo = "myapp"
 *  ci_name  = "CircleCI"
 * }
 * ```
 */

locals {
  project = var.ci_project == "" ? var.ecr_repo : var.ci_project
}

data "aws_ecr_repository" "main" {
  name = var.ecr_repo
}

resource "aws_iam_user" "main" {
  name          = "${lower(var.ci_name)}-${local.project}"
  force_destroy = true

  tags = {
    Automation = "Terraform"
  }
}

resource "aws_iam_group" "main" {
  name = "${lower(var.ci_name)}-${local.project}"
}

resource "aws_iam_group_membership" "main" {
  name  = "${lower(var.ci_name)}-${local.project}-group-membership"
  users = ["${lower(var.ci_name)}-${local.project}"]
  group = aws_iam_group.main.name
}

data "aws_iam_policy_document" "main" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
    ]

    resources = [
      data.aws_ecr_repository.main.arn,
    ]
  }
}

resource "aws_iam_policy" "main" {
  name        = "${lower(var.ci_name)}-ecr-${var.ecr_repo}-policy"
  description = "Allow ${var.ci_name} to push new ${var.ecr_repo} ECR images"
  path        = "/"
  policy      = data.aws_iam_policy_document.main.json
}

resource "aws_iam_group_policy_attachment" "main" {
  group      = aws_iam_group.main.name
  policy_arn = aws_iam_policy.main.arn
}

