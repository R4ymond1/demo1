variable "global_tags" {
  type = map
}

variable "resource_prefix" {
  type = string
}

variable "aws_region" {
  description = "AWS region to deploy the potholes stack"
  type        = string
}
