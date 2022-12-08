output "endpoint_ids" {
  description = "ID of the VPC endpoints"
  value       = module.default.endpoint_ids
}

output "endpoint_arns" {
  description = "ARN of the VPC endpoints"
  value       = module.default.endpoint_arns
}

output "endpoint_dns_entries" {
  description = "DNS entries of the VPC endpoints"
  value       = module.default.endpoint_dns_entries
}

output "endpoint_network_interface_ids" {
  description = "One or more network interfaces for the VPC endpoints"
  value       = module.default.endpoint_network_interface_ids
}

output "endpoint_owner_ids" {
  description = "The IDs of the AWS account that owns the VPC endpoints"
  value       = module.default.endpoint_owner_ids
}

output "endpoint_states" {
  description = "The state of the VPC endpoints"
  value       = module.default.endpoint_states
}
