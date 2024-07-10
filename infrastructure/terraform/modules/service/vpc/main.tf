
data "aws_vpc" "public_vpc" {
  id = var.public_vpc_id
}


data "aws_subnets" "public_vpc_public_subnets" {
  filter {
    name   = "vpc-id"
    values = [
      var.public_vpc_id
    ]
  }

#   tags = {
#     access = "public"
#   }
}
