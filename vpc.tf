# Use an existing VPC block

data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

# Use existing subnets

data "aws_subnets" "existing_subnets" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }
}
output "filtered_subnets" {
  value = data.aws_subnets.existing_subnets.ids
}
