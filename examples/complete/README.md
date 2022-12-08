# Complete example

Configuration in this directory creates:

* VPC Endpoint for each Datadog service using subnet_ids, security_group_ids, policies, and tags specific to each VPC endpoint

## Usage

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

Note that this example may create resources which will incur monetary charges on your AWS bill. Run `terraform destroy` when you no longer need these resources.

<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_default"></a> [default](#module\_default) | ../../ | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_arns"></a> [endpoint\_arns](#output\_endpoint\_arns) | ARN of the VPC endpoints |
| <a name="output_endpoint_dns_entries"></a> [endpoint\_dns\_entries](#output\_endpoint\_dns\_entries) | DNS entries of the VPC endpoints |
| <a name="output_endpoint_ids"></a> [endpoint\_ids](#output\_endpoint\_ids) | ID of the VPC endpoints |
| <a name="output_endpoint_network_interface_ids"></a> [endpoint\_network\_interface\_ids](#output\_endpoint\_network\_interface\_ids) | One or more network interfaces for the VPC endpoints |
| <a name="output_endpoint_owner_ids"></a> [endpoint\_owner\_ids](#output\_endpoint\_owner\_ids) | The IDs of the AWS account that owns the VPC endpoints |
| <a name="output_endpoint_states"></a> [endpoint\_states](#output\_endpoint\_states) | The state of the VPC endpoints |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-restore -->

Apache 2 Licensed. See [LICENSE](https://github.com/credsimple/terraform-aws-datadog-vpc-endpoints/tree/master/LICENSE) for full details.
