resource "aws_glue_job" "energy_etl" {
  name     = "energy-etl"
  role_arn = aws_iam_role.glue_role.arn

  command {
    script_location = "s3://${var.s3_bucket_arn}/etl-script.py"
  }
}

resource "aws_iam_role" "glue_role" {
  name = "glue-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "glue.amazonaws.com"
        }
      }
    ]
  })
}