output "public_vpc_public_subnets_ids" {
  value = data.aws_subnets.public_vpc_public_subnets.ids
}
