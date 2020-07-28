Creates an IAM user/group for CI to use to push images to ECR.

Creates the following resources:

* IAM user, group, and policy.

## Terraform Versions

Terraform 0.12. Pin module version to ~> 2.X. Submit pull-requests to master branch.

Terraform 0.11. Pin module version to ~> 1.X. Submit pull-requests to terraform011 branch.

## Usage

```hcl
module "ecr_ci_myapp" {
 source = "trussworks/iam-ecr-ci/aws"

 ecr_repo = "myapp"
 ci_name  = "CircleCI"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Error: Failed to read module directory: Module directory /var/folders/dv/4lwc_5g10m7988rszs5thkk00000gn/T//terraform-docs-GI2oTUOeB4.tf does not exist or cannot be read.
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
