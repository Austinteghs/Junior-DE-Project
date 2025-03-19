output "lambda_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.energy_processor.arn
}