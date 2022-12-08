locals {
  # Datadog PrivateLink Service Names from
  # https://docs.datadoghq.com/agent/guide/private-link/?tab=useast1
  services = {
    agent-logs = "com.amazonaws.vpce.us-east-1.vpce-svc-025a56b9187ac1f63"
    user-logs  = "com.amazonaws.vpce.us-east-1.vpce-svc-0e36256cb6172439d"
    api        = "com.amazonaws.vpce.us-east-1.vpce-svc-064ea718f8d0ead77"
    metrics    = "com.amazonaws.vpce.us-east-1.vpce-svc-09a8006e245d1e7b8"
    containers = "com.amazonaws.vpce.us-east-1.vpce-svc-0ad5fb9e71f85fe99"
    process    = "com.amazonaws.vpce.us-east-1.vpce-svc-0ed1f789ac6b0bde1"
    profiling  = "com.amazonaws.vpce.us-east-1.vpce-svc-022ae36a7b2472029"
    traces     = "com.amazonaws.vpce.us-east-1.vpce-svc-0355bb1880dfa09c2"
  }
}

resource "aws_vpc_endpoint" "datadog" {
  for_each = { for svc in var.services : svc => local.services[svc] if var.services[svc].enabled }

  service_name        = each.value
  vpc_endpoint_type   = "Interface"
  private_dns_enabled = true

  vpc_id             = var.vpc_id
  subnet_ids         = coalescelist(each.value.subnet_ids, var.subnet_ids)
  security_group_ids = coalescelist(each.value.security_group_ids, var.security_group_ids)

  tags = merge({ Name = "datadog-${each.key}" }, var.tags, each.value.tags)
}
