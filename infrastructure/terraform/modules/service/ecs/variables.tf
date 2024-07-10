variable "global_tags" {
  type = map
}

variable "stage_validation" {
  type = bool
}

variable "resource_prefix" {
  type = string
}

variable "aws_endpoint_url" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "demo1_repo_url" {
  type = string
}

variable "demo1_log_group_name" {
  type = string
}



variable "ecs_task_role_arn" {
  type = string
}

# variable "api_lb_tg_arn" {
#   type = string
# }
#
# variable "api_lb_dns_name" {
#   type = string
# }


variable "public_vpc_public_subnets_ids" {
  type = list
}

variable "public_vpc_sg_id" {
  type = string
}


variable "demo1_cpu" {
  type = number
}

variable "demo1_memory" {
  type = number
}

variable "demo1_service_port" {
  type = number
}

variable "demo1_desired_count" {
  type = number
}


variable "time_zone" {
  type = string
}

variable "application_bucket" {
  type = string
}


