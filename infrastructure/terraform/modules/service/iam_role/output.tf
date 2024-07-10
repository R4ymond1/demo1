output "ecs_role_arn" {
  value = data.aws_iam_role.ecs_role.arn
}

output "ecs_task_role_arn" {
  value = data.aws_iam_role.ecs_task_role.arn
}

output "ec2_role_arn" {
  value = data.aws_iam_role.ec2_role.arn
}

output "lambda_role_arn" {
  value = data.aws_iam_role.lambda_role.arn
}

output "emr_role_arn" {
  value = data.aws_iam_role.emr_role.arn
}

output "ec2_role_profile_name" {
  value = data.aws_iam_instance_profile.emr_ec2_role.name
}

output "emr_ec2_role_arn" {
  value = data.aws_iam_instance_profile.emr_ec2_role.arn
}

output "sf_role_arn" {
  value = data.aws_iam_role.sf_role.arn
}

output "eb_role_arn" {
  value = data.aws_iam_role.eb_role.arn
}

output "rds_role_arn" {
  value = data.aws_iam_role.rds_role.arn
}

output "glue_role_arn" {
  value = data.aws_iam_role.glue_role.arn
}
