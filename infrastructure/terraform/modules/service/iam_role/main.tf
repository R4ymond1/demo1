data "aws_iam_role" "ecs_role" {
  name = "${var.resource_prefix}-ecs-role"
}

data "aws_iam_role" "ecs_task_role" {
  name = "${var.resource_prefix}-ecs-task-role"
}

data "aws_iam_role" "ec2_role" {
  name = "${var.resource_prefix}-ec2-role"
}

data "aws_iam_role" "lambda_role" {
  name = "${var.resource_prefix}-lambda-role"
}

data "aws_iam_role" "emr_role" {
  name = "${var.resource_prefix}-emr-role"
}

data "aws_iam_instance_profile" "emr_ec2_role" {
  name = "${var.resource_prefix}-emr-ec2-role"
}

data "aws_iam_role" "sf_role" {
  name = "${var.resource_prefix}-sf-role"
}

data "aws_iam_role" "eb_role" {
  name = "${var.resource_prefix}-eb-role"
}

data "aws_iam_role" "rds_role" {
  name = "${var.resource_prefix}-rds-role"
}

data "aws_iam_role" "glue_role" {
  name = "${var.resource_prefix}-glue-role"
}
