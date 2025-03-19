provider "aws" {
  region = var.region
}

module "iot_core" {
  source = "./modules/iot-core"
}

module "kinesis" {
  source = "./modules/kinesis"
}

module "lambda" {
  source       = "./modules/lambda"
  iot_core_arn = module.iot_core.iot_core_arn
  kinesis_arn  = module.kinesis.kinesis_arn
}

module "firehose" {
  source         = "./modules/firehose"
  s3_bucket_arn  = module.s3.s3_bucket_arn
}

module "timestream" {
  source = "./modules/timestream"
}

module "s3" {
  source = "./modules/s3"
}

module "glue" {
  source         = "./modules/glue"
  s3_bucket_arn  = module.s3.s3_bucket_arn
}

module "athena" {
  source = "./modules/athena"
}

module "quicksight" {
  source = "./modules/quicksight"
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}