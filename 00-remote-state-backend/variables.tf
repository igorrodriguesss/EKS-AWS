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

variable "remote_backend" {
  type = object({
    bucket_name               = string
    dynamo_table_name         = string
    dynamo_table_hash_key     = string
    dynamo_table_billing_mode = string
  })

  default = {
    bucket_name               = "workshop-terraform-state-bucket-irodrigues"
    dynamo_table_name         = "workshop-state-locking-table"
    dynamo_table_hash_key     = "LockID"
    dynamo_table_billing_mode = "PAY_PER_REQUEST"
  }
}

variable "project_name" {
  type    = string
  default = "devops-nuvem"
}