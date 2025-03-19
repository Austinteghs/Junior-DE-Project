resource "aws_iot_topic_rule" "energy_rule" {
  name        = "EnergyRule"
  sql         = "SELECT * FROM 'energy/data'"
  sql_version = "2025-03-19"
  enabled     = true

  kinesis {
    stream_name = var.kinesis_stream_name
    role_arn    = aws_iam_role.iot_kinesis_role.arn
  }
}

resource "aws_iam_role" "iot_kinesis_role" {
  name = "iot-kinesis-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "iot.amazonaws.com"
        }
      }
    ]
  })
}

output "iot_core_arn" {
  value = aws_iot_topic_rule.energy_rule.arn
}