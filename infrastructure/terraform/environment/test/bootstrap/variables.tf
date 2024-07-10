locals {
  stage                    = "test"
  aws_region               = "cn-north-1"
  aws_profile              = "pw-${local.stage}"
  shared_credentials_files = ["~/.aws/credentials"]
  resource_prefix          = "pw-tlp-${local.stage}-raymond"
  global_tags              = {
    namespace = "com.bmw"
    project   = "pw"
    stage     = local.stage
  }
}