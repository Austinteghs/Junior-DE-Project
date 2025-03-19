resource "aws_kinesis_stream" "energy_stream" {
  name             = "energy-consumption-stream"
  shard_count      = 1
  retention_period = 24
  encryption_type  = "KMS"
}

output "kinesis_arn" {
  value = aws_kinesis_stream.energy_stream.arn
}