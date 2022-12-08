provider "aws" {
  region = local.region
}

locals {
  region = "us-east-1"
  name   = "datadog-privatelink-ex-${replace(basename(path.cwd), "_", "-")}"

  tags = {
    Name       = local.name
    Example    = local.name
    Repository = "https://github.com/terraform-aws-modules/terraform-aws-datadog-forwarders"
  }
}

################################################################################
# Module
################################################################################
module "default" {
  source = "../../"
  vpc_id = "vpc-1234567890abcdef0"
  tags   = local.tags
  services = {
    agent-logs = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        AgentLogsVPCEndpoint = true
      }
    }
    user-logs = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        UserLogsVPCEndpoint = true
      }
    }
    api = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        ApiVPCEndpoint = true
      }
    }
    metrics = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        MetricsVPCEndpoint = true
      }
    }
    containers = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        ContainersVPCEndpoint = true
      }
    }
    process = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        ProcessVPCEndpoint = true
      }
    }
    profiling = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        ProfilingVPCEndpoint = true
      }
    }
    traces = {
      enabled            = true
      subnet_ids         = module.vpc.private_subnets
      security_group_ids = [module.security_group.security_group_id]
      tags = {
        TracesVPCEndpoint = true
      }
    }
  }
}

################################################################################
# Supporting Resources
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = local.name
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1c", "us-east-1d"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway      = false # not required, using private VPC endpoint
  single_nat_gateway      = true
  map_public_ip_on_launch = false

  manage_default_security_group  = true
  default_security_group_ingress = []
  default_security_group_egress  = []

  # Required for VPC Endpoints
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = local.tags
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Example security group"
  vpc_id      = module.vpc.vpc_id

  # ingress
  ingress_with_self = [
    {
      rule        = "https-443-tcp"
      description = "Allow all internal HTTPs"
    },
  ]

  # egress
  computed_egress_with_self = [
    {
      rule        = "https-443-tcp"
      description = "Allow all internal HTTPs"
    },
  ]
  number_of_computed_egress_with_self = 1

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = local.tags
}
