# Datadog/AWS PrivateLink Terraform module

Terraform module which creates VPC Endpoints powered by AWS PrivateLink to Datadog.

## Usage

See [`examples`](https://github.com/credsimple/terraform-aws-datadog-privatelink/tree/master/examples) directory for working examples to reference:

```hcl
module "datadog_privatelink" {
  source  = "credsimple/datadog-privatelink/aws"

  vpc_id             = "vpc-12345678"
  subnet_ids         = ["subnet-12345678"]
  security_group_ids = ["sg-12345678"]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Examples

Examples codified under the [`examples`](https://github.com/credsimple/terraform-aws-datadog-privatelink/tree/master/examples) are intended to give users references for how to use the module(s) as well as testing/validating changes to the source code of the module(s). If contributing to the project, please be sure to make any appropriate updates to the relevant examples to allow maintainers to test your changes and to keep the examples up to date for users. Thank you!

- [Complete](https://github.com/credsimple/terraform-aws-datadog-privatelink/tree/master/examples/complete)
- [Simple](https://github.com/credsimple/terraform-aws-datadog-privatelink/tree/master/examples/simple)

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint.datadog](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | IDs of security groups to attach to all endpoints | `list(string)` | `[]` | no |
| <a name="input_services"></a> [services](#input\_services) | Controls the Datadog services for which a VPC endpoint should be created. Defaults to all services | <pre>object({<br>    agent-logs = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    user-logs = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    api = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    metrics = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    containers = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    process = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    profiling = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>    traces = object({<br>      enabled            = bool<br>      subnet_ids         = list(string)<br>      security_group_ids = list(string)<br>      tags               = map(string)<br>    })<br>  })</pre> | <pre>{<br>  "agent-logs": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "api": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "containers": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "metrics": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "process": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "profiling": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "traces": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  },<br>  "user-logs": {<br>    "enabled": true,<br>    "security_group_ids": [],<br>    "subnet_ids": [],<br>    "tags": {}<br>  }<br>}</pre> | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | IDs of subnets to associate with all endpoints | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to all endpoints | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of VPC to provision endpoints within | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_arns"></a> [endpoint\_arns](#output\_endpoint\_arns) | ARN of the VPC endpoints |
| <a name="output_endpoint_dns_entries"></a> [endpoint\_dns\_entries](#output\_endpoint\_dns\_entries) | DNS entries of the VPC endpoints |
| <a name="output_endpoint_ids"></a> [endpoint\_ids](#output\_endpoint\_ids) | ID of the VPC endpoints |
| <a name="output_endpoint_network_interface_ids"></a> [endpoint\_network\_interface\_ids](#output\_endpoint\_network\_interface\_ids) | One or more network interfaces for the VPC endpoints |
| <a name="output_endpoint_owner_ids"></a> [endpoint\_owner\_ids](#output\_endpoint\_owner\_ids) | The ID of the AWS account that owns the VPC endpoints |
| <a name="output_endpoint_states"></a> [endpoint\_states](#output\_endpoint\_states) | The state of the VPC endpoints |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-restore -->
## Authors

Module is maintained by the [andros.co SRE team](https://andros.co) with help from [these awesome contributors](https://github.com/credsimple/terraform-aws-datadog-privatelink/graphs/contributors).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/credsimple/terraform-aws-datadog-privatelink/tree/master/LICENSE) for full details.
