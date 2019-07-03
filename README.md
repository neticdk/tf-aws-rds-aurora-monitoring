# Netic AWS RDS/Aurora Monitoring Module

## Supported Terraform Versions

Terraform 0.12

## Usage

```hcl
module "db" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "~> 2.0"
  [...]
}

resource "aws_sns_topic" "this" {
  name = "my-topic"
}

module "db_monitoring" {
  source = "github.com/neticdk/tf-aws-rds-aurora-monitoring"

  cluster_identifier = module.db.this_rds_cluster_id
  sns_topic          = sns-topic.this.sns_topic_arn
}
```
<!---BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK--->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_identifier | The RDS Cluster Identifier | string | n/a | yes |
| connection\_limit\_critical\_threshold | Connection limit critical threshold | number | `"1000"` | no |
| connection\_limit\_warning\_threshold | Connection limit warning threshold | number | `"900"` | no |
| connection\_read\_latency\_warning\_threshold | Connection read_ atency warning threshold | number | `"0.02"` | no |
| connection\_write\_latency\_warning\_threshold | Connection write latency warning threshold | number | `"0.02"` | no |
| max\_connections | Maximum connections allowed in the cluster | number | `"1000"` | no |
| sns\_topic | ARN of SNS topic | string | n/a | yes |
| tags | A map of tags to add to all resources | map | `<map>` | no |

<!---END OF PRE-COMMIT-TERRAFORM DOCS HOOK--->

# Copyright
Copyright (c) 2019 Netic A/S. All rights reserved.

# License
MIT Licened. See LICENSE for full details.

