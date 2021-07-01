resource "aws_kinesis_stream" "mod" {
  name             = var.stream-name
  shard-count      = var.shard-count
  retention-period = var.retention-period

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
    "OutgoingRecords",
    "ReadProvisionedThroughputExceeded",
    "WriteProvisionedThroughputExceeded",
    "IncomingRecords",
    "IteratorAgeMilliseconds",
  ]

  tags = {
    ForwardToFirehoseStream = var.s3-backup ? join("", aws_kinesis_firehose_delivery_stream.mod.*.name) : ""
  }
}

