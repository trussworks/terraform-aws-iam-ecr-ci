variable "ecr_repo" {
  type        = string
  description = "Name of the ECR repository."
}

variable "ci_name" {
  type        = string
  description = "Name of the CI system (e.g., CircleCI, Jenkins, …)."
}

variable "ci_project" {
  type        = string
  description = "Name of the project being built. Uses ecr_repo name by default."
  default     = ""
}

