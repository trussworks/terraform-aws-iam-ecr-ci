## Terraform Versions

Terraform 0.13 and newer. Pin module version to ~> 3.X. Submit pull-requests to master branch.

Terraform 0.12. Pin module version to ~> 2.X. Submit pull-requests to terraform012 branch.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

Creates an IAM user/group for CI to use to push images to ECR.

Creates the following resources:

- IAM user, group, and policy.

## Usage

```hcl
module "ecr_ci_myapp" {
 source = "trussworks/iam-ecr-ci/aws"

 ecr_repo = "myapp"
 ci_name  = "CircleCI"
}
```

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 0.13 |
| aws       | >= 3.0  |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | >= 3.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                            | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group)                                     | resource    |
| [aws_iam_group_membership.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership)               | resource    |
| [aws_iam_group_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource    |
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy)                                   | resource    |
| [aws_iam_user.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user)                                       | resource    |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_repository)                        | data source |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document)              | data source |

## Inputs

| Name       | Description                                                     | Type     | Default | Required |
| ---------- | --------------------------------------------------------------- | -------- | ------- | :------: |
| ci_name    | Name of the CI system (e.g., CircleCI, Jenkins, …).             | `string` | n/a     |   yes    |
| ci_project | Name of the project being built. Uses ecr_repo name by default. | `string` | `""`    |    no    |
| ecr_repo   | Name of the ECR repository.                                     | `string` | n/a     |   yes    |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
```
