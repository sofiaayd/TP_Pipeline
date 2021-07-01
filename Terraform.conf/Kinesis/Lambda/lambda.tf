resource "aws_lambda_function" "mod" {
  count = var.s3-backup

  s3_bucket     = var.lambda_s3_bucket
  s3_key        = var.lambda_s3_key
  function_name = "${var.}-LambdaStreamToFirehose"
  role          = aws_iam_role.lambda_role[0].arn
  handler       = "index.handler"
  runtime       = "nodejs4.3"

  environment {
    variables = {
      USE_DEFAULT_DELIVERY_STREAMS = "false"
    }
  }
}

resource "aws_lambda_event_source_mapping" "mod" {
  count = var.s3-backup

  batch_size        = 100
  event_source_arn  = aws_kinesis_stream.mod.arn
  enabled           = true
  function_name     = aws_lambda_function.mod[0].arn
  starting_position = "TRIM_HORIZON"
  //we can use Latest if we want to analyze only the latest streams 

}

