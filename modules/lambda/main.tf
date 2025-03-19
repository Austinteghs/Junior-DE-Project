resource "aws_lambda_function" "energy_processor" {
  function_name = "energy-processor"
  handler       = "index.handler"
  runtime       = "python3.8"
  role          = aws_iam_role.lambda_exec_role.arn

  environment {
    variables = {
      TIMESTREAM_DB = var.timestream_db_name
    }
  }
}

resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

output "lambda_arn" {
  value = aws_lambda_function.energy_processor.arn
}