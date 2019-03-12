<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Creates an IAM user/group for CI to use to push images to ECR.

Creates the following resources:

* IAM user, group, and policy.

## Usage

```hcl
module "ecr_ci_myapp" {
 source = "trussworks/iam-ecr-ci/aws"

 ecr_repo = "myapp"
 ci_name  = "CircleCI"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ci\_name | Name of the CI system (e.g., CircleCI, Jenkins, …). | string | n/a | yes |
| ci\_project | Name of the project being built. Uses ecr_repo name by default. | string | `""` | no |
| ecr\_repo | Name of the ECR repository. | string | n/a | yes |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
