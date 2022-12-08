variable "vpc_id" {
  description = "ID of VPC to provision endpoints within"
  type        = string
  default     = null
}

variable "services" {
  description = "Controls the Datadog services for which a VPC endpoint should be created. Defaults to all services"
  type = object({
    agent-logs = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    user-logs = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    api = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    metrics = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    containers = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    process = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    profiling = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
    traces = object({
      enabled            = bool
      subnet_ids         = list(string)
      security_group_ids = list(string)
      tags               = map(string)
    })
  })
  default = {
    agent-logs = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    user-logs = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    api = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    metrics = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    containers = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    process = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    profiling = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
    traces = {
      enabled            = true
      subnet_ids         = []
      security_group_ids = []
      tags               = {}
    }
  }
}

variable "subnet_ids" {
  description = "IDs of subnets to associate with all endpoints"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "IDs of security groups to attach to all endpoints"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to apply to all endpoints"
  type        = map(string)
  default     = {}
}
