output "kinesis_arn" {
  description = "ARN of the Kinesis Data Stream"
  value       = aws_kinesis_stream.energy_stream.arn
}