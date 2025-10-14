data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = ["${var.project_name}-vpc"]
  }
}