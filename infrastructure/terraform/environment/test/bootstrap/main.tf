# terraform {
#   backend "s3" {
#     bucket  = "pw-tlp-test-terraform-bucket-raymond"
#     region  = "cn-north-1"
#     profile = "pw-test"
#     key     = "bootstrap/terraform.states"
#   }
# }

provider "aws" {
  region = local.aws_region
  shared_credentials_files = local.shared_credentials_files
  profile = local.aws_profile
}
module "ecr" {
  source = "../../../modules/bootstrap/ecr"

  global_tags     = local.global_tags
  resource_prefix = local.resource_prefix
}

module "s3" {
  source = "../../../modules/bootstrap/s3"

  global_tags     = local.global_tags
  resource_prefix = local.resource_prefix
}