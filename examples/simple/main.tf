module "ecr_ci" {
  source = "../../"

  ecr_repo = "${aws_ecr_repository.main.name}"
  ci_name  = "${var.ci_name}"
}

resource "aws_ecr_repository" "main" {
  name = "${var.ecr_repo}"
}