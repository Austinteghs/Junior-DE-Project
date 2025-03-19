output "iot_core_arn" {
  description = "ARN of the IoT Core rule"
  value       = aws_iot_topic_rule.energy_rule.arn
}