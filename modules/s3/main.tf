resource "aws_s3_bucket" "energy_bucket" {
  bucket = "energy-raw-data"
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.energy_bucket.arn
}