variable "global_tags" {
  type = map
}

variable "resource_prefix" {
  type = string
}

variable "public_vpc_id" {
  type = string
}

variable "public_vpc_public_subnets_ids" {
  type = list
}

variable "api_service_port" {
  type = number
}
