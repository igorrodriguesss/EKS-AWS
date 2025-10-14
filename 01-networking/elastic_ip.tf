resource "aws_eip" "this" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-public-eip"
  }
}