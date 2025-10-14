data "aws_subnets" "private" {
  filter {
    name = "tag:Name"
    values = [
      "${var.project_name}-private-subnet-1a",
      "${var.project_name}-private-subnet-1b"
    ]
  }

  filter {
    name   = "tag:Environment"
    values = ["Production"]
  }
}