output "endpoint_ids" {
  description = "ID of the VPC endpoints"
  value       = { for key, svc in aws_vpc_endpoint.datadog : key => svc.id }
}

output "endpoint_arns" {
  description = "ARN of the VPC endpoints"
  value       = { for key, svc in aws_vpc_endpoint.datadog : key => svc.arn }
}

output "endpoint_dns_entries" {
  description = "DNS entries of the VPC endpoints"
  value       = { for key, svc in aws_vpc_endpoint.datadog : key => svc.dns_entry }
}

output "endpoint_network_interface_ids" {
  description = "One or more network interfaces for the VPC endpoints"
  value       = { for key, svc in aws_vpc_endpoint.datadog : key => svc.network_interface_ids }
}

output "endpoint_owner_ids" {
  description = "The ID of the AWS account that owns the VPC endpoints"
  value       = { for key, svc in aws_vpc_endpoint.datadog : key => svc.owner_id }
}

output "endpoint_states" {
  description = "The state of the VPC endpoints"
  value       = { for key, svc in aws_vpc_endpoint.datadog : key => svc.state }
}
