output "endpoint_ids" {
  description = "ID of the VPC endpoints"
  value       = { for svc in aws_vpc_endpoint.datadog : svc.key => svc.value.id }
}

output "endpoint_arns" {
  description = "ARN of the VPC endpoints"
  value       = { for svc in aws_vpc_endpoint.datadog : svc.key => svc.value.arn }
}

output "endpoint_dns_entries" {
  description = "DNS entries of the VPC endpoints"
  value       = { for svc in aws_vpc_endpoint.datadog : svc.key => svc.value.dns_entry }
}

output "endpoint_network_interface_ids" {
  description = "One or more network interfaces for the VPC endpoints"
  value       = { for svc in aws_vpc_endpoint.datadog : svc.key => svc.value.network_interface_ids }
}

output "endpoint_owner_ids" {
  description = "The ID of the AWS account that owns the VPC endpoints"
  value       = { for svc in aws_vpc_endpoint.datadog : svc.key => svc.value.owner_id }
}

output "endpoint_states" {
  description = "The state of the VPC endpoints"
  value       = { for svc in aws_vpc_endpoint.datadog : svc.key => svc.value.state }
}
