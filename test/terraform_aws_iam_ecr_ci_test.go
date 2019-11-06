package test

import (
	"fmt"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraformAwsIamEcrCi(t *testing.T) {
	t.Parallel()

	ecrRepo := fmt.Sprintf("ecr-repo-%s", strings.ToLower(random.UniqueId()))

	terraformOptions := &terraform.Options{
		TerraformDir: "../examples/simple/",
		Vars: map[string]interface{}{
			"ecr_repo": ecrRepo,
			"ci_name":  "CircleCI",
		},
	}

	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
}
