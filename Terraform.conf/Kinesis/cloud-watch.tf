resource "aws_cloudwatch_log_group" "mod" {
  name  = var.stream-name
  count = var.s3-backup
}

resource "aws_cloudwatch_log_stream" "mod" {
  name  = "S3Delivery"
  count = var.s3-backup
  log_group_name = aws_cloudwatch_log_group.mod[0].name
}
