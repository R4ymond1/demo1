locals {
  stage                    = "test"
  stage_validation         = local.stage == "test"
  aws_region               = "cn-north-1"
  aws_profile              = "pw-${local.stage}"
  shared_credentials_files = [
    "~/.aws/credentials"
  ]
  resource_prefix = "pw-tlp-${local.stage}-raymond"
  global_tags     = {
    namespace = "com.bmw"
    project   = "pw"
    stage     = local.stage
  }
}

variable "demo1_cpu" {
  default = 1024
}

variable "demo1_memory" {
  default = 3072
}

variable "demo1_service_port" {
  default = 8091
}

variable "demo1_desired_count" {
  default = 1
}

variable "public_vpc_id" {
  default = "vpc-0b34e36651753bb42"
}

variable "public_vpc_sg_id" {
  default = "sg-04688db10bbda8c52"
}

variable "availability_zone" {
  default = "cn-north-1"
}

variable "is_scheduling_enabled" {
  default = false
}

variable "ecs_trigger_script_trigger_time" {
  default = "19"
}

variable "cost_budget_limit" {
  default = "2000"
}

variable "classifier_task_count" {
  default = 0
}



variable "aws_endpoint_url" {
  default = "https://s3.cn-north-1.amazonaws.com.cn"
}



variable "time_zone" {
  default = "Asia/Shanghai"
}

variable "classifier_container_name" {
  default = "classifier-container-config"
}
