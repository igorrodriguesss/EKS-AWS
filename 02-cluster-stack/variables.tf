variable "auth" {
  type = object({
    region          = string
    assume_role_arn = string
  })

  default = {
    region          = "us-east-1"
    assume_role_arn = "arn:aws:iam::829115578807:role/devops-nuvem"
  }
}
variable "tags" {
  type = map(string)
  default = {
    Project     = "DevOps na Nuvem"
    Owner       = "Igor Rodrigues"
    Environment = "Production"
  }
}

variable "project_name" {
  type    = string
  default = "devops-nuvem"
}

variable "eks_cluster" {
  type = object({
    version                   = string
    enabled_cluster_log_types = list(string)
    access_config = object({
      authentication_mode = string
    })
    instance_type = list(string)
    capacity_type = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  })

  default = {
    version = "1.31"
    enabled_cluster_log_types = [
      "api",
      "audit",
      "authenticator",
      "controllerManager",
      "scheduler"
    ],
    access_config = {
      authentication_mode = "API_AND_CONFIG_MAP"
    }
    instance_type = [
      "t3.medium"
    ]
    capacity_type = "ON_DEMAND"
    scaling_config = {
      desired_size = 2
      max_size     = 2
      min_size     = 2
    }
  }
}

variable "ecr_repositories" {
  type = list(object({
    name = string
  }))

  default = [
    {
      name = "dvn-workshop/production/frontend"
    },
    {
      name = "dvn-workshop/production/backend"
    }
  ]
}