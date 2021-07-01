resource "aws_s3_bucket" "mod" {
  count = var.create-api-gateway

  bucket = "udacity-${var.stream-name}-event-backup"
  acl    = "private"
}

resource "aws_kinesis_firehose_delivery_stream" "mod" {
  name  = "${var.stream-name}-backup"
  count = var.create-api-gateway

  destination = "s3"

  s3_configuration {
    role_arn   = aws_iam_role.firehose_role[0].arn
    bucket_arn = aws_s3_bucket.mod[0].arn

    cloudwatch_logging_options {
      enabled         = "true"
      log_group_name  = aws_cloudwatch_log_group.mod[0].name
      log_stream-name = aws_cloudwatch_log_stream.mod[0].name
    }
  }
