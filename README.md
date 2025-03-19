# Junior Data Engineer Project

## Overview
This project provides a real-time, serverless, and cost-effective AWS-native solution to monitor energy consumption in an apartment using an IoT box.

## Architecture
The architecture includes:
- **AWS IoT Core**: Ingests data from the IoT device.
- **Kinesis Data Streams**: Handles real-time data ingestion.
- **AWS Lambda**: Processes data in real time.
- **Kinesis Firehose**: Batches data to S3.
- **Amazon Timestream**: Stores processed data for real-time queries.
- **Amazon S3**: Stores raw data for long-term storage.
- **AWS Glue**: Transforms raw data for efficient querying.
- **Amazon Athena**: Queries transformed data in S3.
- **Amazon QuickSight**: Visualizes data for stakeholders.
- **AWS CloudWatch**: Monitors system health and performance.

## Deployment
1. Clone this repository.
2. Run `terraform init` to initialize the working directory.
3. Run `terraform plan` to review the deployment plan.
4. Run `terraform apply` to deploy the infrastructure.

## Documentation
Refer to the [framework documentation](./documentation/framework.md) for details on the solution design, implementation, and operational considerations.
