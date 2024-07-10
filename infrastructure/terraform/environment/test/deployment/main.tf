provider "aws" {
  region                   = local.aws_region
  shared_credentials_files = local.shared_credentials_files
  profile                  = local.aws_profile
}

# data "terraform_remote_state" "bootstrap_output" {
#   backend = "s3"
#   config  = {
#     bucket  = "pw-tlp-test-terraform-bucket-raymond"
#     region  = local.aws_region
#     profile = local.aws_profile
#     key     = "bootstrap/terraform.states"
#   }
# }

# module "s3" {
#   source = "../../../modules/service/s3"
#
#   global_tags      = local.global_tags
#   resource_prefix  = local.resource_prefix
#   stage_validation = local.stage_validation
#
#   application_bucket = data.terraform_remote_state.bootstrap_output.outputs.application_bucket
# }

module "cloudwatch" {
  source = "../../../modules/service/cloudwatch"

  global_tags     = local.global_tags
  resource_prefix = local.resource_prefix

  aws_region = local.aws_region
}


# module "iam_role" {
#   source = "../../../modules/service/iam_role"
#
#   resource_prefix = local.resource_prefix
# }

module "vpc" {
  source = "../../../modules/service/vpc"

  public_vpc_id  = var.public_vpc_id
}

module "security_group" {
  source = "../../../modules/service/security_group"

  global_tags     = local.global_tags
  resource_prefix = local.resource_prefix

  public_vpc_id     = var.public_vpc_id
  public_vpc_sg_id  = var.public_vpc_sg_id
}

module "ecs" {
  source = "../../../modules/service/ecs"

  global_tags     = local.global_tags
  resource_prefix = local.resource_prefix
  aws_region      = local.aws_region

  ecs_task_role_arn               = "arn:aws-cn:iam::857461516512:role/pw-tlp-test-ecs-task-role"
  public_vpc_public_subnets_ids   = module.vpc.public_vpc_public_subnets_ids
  public_vpc_sg_id                = module.security_group.public_vpc_sg_id

#   demo1_repo_url       = data.terraform_remote_state.bootstrap_output.outputs.demo1_repo_url
  demo1_repo_url = "857461516512.dkr.ecr.cn-north-1.amazonaws.com.cn/pw-tlp-test-raymond-demo1-repo"
  demo1_log_group_name = module.cloudwatch.demo1_log_group_name
  demo1_cpu            = var.demo1_cpu
  demo1_memory         = var.demo1_memory
  demo1_service_port   = var.demo1_service_port
  demo1_desired_count  = var.demo1_desired_count

#   api_lb_tg_arn                            = module.load_balancer.api_lb_tg_arn
#   api_lb_dns_name                          = module.load_balancer.api_lb_dns_name


  aws_endpoint_url                 = var.aws_endpoint_url
  time_zone                        = var.time_zone
#   application_bucket               = data.terraform_remote_state.bootstrap_output.outputs.application_bucket
  application_bucket = "pw-tlp-test-raymond-application-bucket"

  stage_validation = local.stage_validation
}

# module "load_balancer" {
#   source = "../../../modules/service/load_balancer"
#
#   global_tags     = local.global_tags
#   resource_prefix = local.resource_prefix
#
#   public_vpc_id                   = var.public_vpc_id
#   public_vpc_public_subnets_ids   = module.vpc.public_vpc_public_subnets_ids
#   api_service_port                = var.demo1_service_port
# }


