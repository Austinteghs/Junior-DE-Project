# variables.tf (root module)
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "af-south-1"
}

variable "kinesis_stream_name" {
  description = "Name of the Kinesis Data Stream"
  type        = string
  default     = "energy-consumption-stream"
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for raw data"
  type        = string
  default     = "energy-raw-data"
}

variable "timestream_db_name" {
  description = "Name of the Timestream database"
  type        = string
  default     = "energy-db"
}