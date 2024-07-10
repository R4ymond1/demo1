resource "aws_s3_bucket" "application_bucket" {
  bucket = "${var.resource_prefix}-application-bucket"
  tags   = var.global_tags
}
