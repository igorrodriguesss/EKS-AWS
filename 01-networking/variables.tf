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

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    public_route_table_name  = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))

  })

  default = {
    name                     = "devops-nuvem"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "devops-nuvem"
    public_route_table_name  = "devops-nuvem-public-rt"
    private_route_table_name = "devops-nuvem-private-rt"

    public_subnets = [
      {
        name                    = "devops-nuvem-public-subnet-1a"
        cidr_block              = "10.0.0.0/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = true
      },
      {
        name                    = "devops-nuvem-public-subnet-1b"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
      }
    ]

    private_subnets = [
      {
        name                    = "devops-nuvem-private-subnet-1a"
        cidr_block              = "10.0.0.128/26"
        availability_zone       = "us-east-1a"
        map_public_ip_on_launch = true
      },
      {
        name                    = "devops-nuvem-private-subnet-1b"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
      }
    ]
  }

}