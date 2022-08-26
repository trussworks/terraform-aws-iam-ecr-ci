## Terraform Versions

Terraform 0.13 and newer. Pin module version to ~> 3.X. Submit pull-requests to master branch.

Terraform 0.12. Pin module version to ~> 2.X. Submit pull-requests to terraform012 branch.

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

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_group.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group) | resource |
| [aws_iam_group_membership.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_membership) | resource |
| [aws_iam_group_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_group_policy_attachment) | resource |
| [aws_iam_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_user.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_ecr_repository.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_repository) | data source |
| [aws_iam_policy_document.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ci_name"></a> [ci\_name](#input\_ci\_name) | Name of the CI system (e.g., CircleCI, Jenkins, …). | `string` | n/a | yes |
| <a name="input_ci_project"></a> [ci\_project](#input\_ci\_project) | Name of the project being built. Uses ecr\_repo name by default. | `string` | `""` | no |
| <a name="input_ecr_repo"></a> [ecr\_repo](#input\_ecr\_repo) | Name of the ECR repository. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Developer Setup

Install dependencies (macOS)

```shell
brew install pre-commit go terraform terraform-docs
```

### Testing

[Terratest](https://github.com/gruntwork-io/terratest) is being used for
automated testing with this module. Tests in the `test` folder can be run
locally by running the following command:

```text
make test
```

Or with aws-vault:

```text
AWS_VAULT_KEYCHAIN_NAME=<NAME> aws-vault exec <PROFILE> -- make test
```
