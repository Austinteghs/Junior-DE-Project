# Framework Documentation

## 1. How the Solution Works
This solution is all about monitoring energy consumption in an apartment using an IoT box. It’s built on AWS services to create a **real-time, serverless, and cost-effective system**. Here’s the breakdown of how it all comes together:

- **Data Collection**: The IoT device collects energy consumption data and sends it to **AWS IoT Core** using the MQTT protocol. Think of it as the starting point where all the data begins its journey.
- **Real-Time Processing**: Once the data hits **Amazon Kinesis Data Streams**, it’s processed in real time by **AWS Lambda**. The processed data then lands in **Amazon Timestream**, which is perfect for fast queries.
- **Batch Processing**: For long-term storage, **Kinesis Firehose** batches the raw data and sends it to **Amazon S3**. This is where the data sits until it’s needed for deeper analysis.
- **Data Transformation**: **AWS Glue** steps in to transform the raw data into Parquet format, making it easier and cheaper to query using **Amazon Athena**.
- **Visualization**: **Amazon QuickSight** takes the stage here, creating dashboards that make it easy for stakeholders to understand the data.
- **Monitoring**: Last but not least, **AWS CloudWatch** keeps an eye on everything, making sure the system runs smoothly and alerting us if something goes wrong.

---

## 2. Why These AWS Services Were Chosen
Choosing the right AWS services was key to making this solution work. Here’s why each service made the cut:

### **AWS IoT Core**
- **Purpose**: It connects IoT devices securely and routes data to the right places.
- **Why It’s Used**: It supports MQTT, which is lightweight and perfect for IoT devices. Plus, it encrypts data in transit using TLS, so everything stays secure.

### **Amazon Kinesis Data Streams**
- **Purpose**: It handles real-time data ingestion.
- **Why It’s Used**: It’s built for high-throughput, low-latency data streaming, which is exactly what we need for real-time processing.

### **AWS Lambda**
- **Purpose**: It processes data in real time (like detecting anomalies or calculating averages).
- **Why It’s Used**: It’s serverless, so it scales automatically, and you only pay for what you use. No need to worry about managing servers!

### **Amazon Kinesis Firehose**
- **Purpose**: It batches data and writes it to S3.
- **Why It’s Used**: By batching data, it reduces the number of S3 PUT requests, which saves money. It’s also super reliable for long-term storage.

### **Amazon Timestream**
- **Purpose**: It stores processed data for real-time queries.
- **Why It’s Used**: It’s optimized for time-series data, so queries are fast, and it scales automatically. Perfect for our needs.

### **Amazon S3**
- **Purpose**: It stores raw and batched data for long-term analysis.
- **Why It’s Used**: It’s highly durable and cost-effective. Plus, you can set up lifecycle policies to manage data retention easily.

### **AWS Glue**
- **Purpose**: It transforms raw data in S3 (like converting JSON to Parquet).
- **Why It’s Used**: It’s a serverless ETL service, so it reduces storage costs and makes querying faster and cheaper.

### **Amazon Athena**
- **Purpose**: It queries transformed data in S3.
- **Why It’s Used**: It’s serverless and charges only for the queries you run. No need to manage infrastructure!

### **Amazon QuickSight**
- **Purpose**: It visualizes data for stakeholders.
- **Why It’s Used**: It creates interactive dashboards that make it easy to understand the data. Plus, it integrates seamlessly with Timestream and Athena.

### **AWS CloudWatch**
- **Purpose**: It monitors system health and performance.
- **Why It’s Used**: It provides logs, metrics, and alerts, so we know if something’s wrong before it becomes a big problem.

---

## 3. Security Measures
Security is a big deal in this solution. Here’s how we’ve tackled it:

### **Encryption**
- **In Transit**: Data is encrypted using TLS when it’s moving between IoT devices, AWS IoT Core, and other services. This keeps it safe from prying eyes.
- **At Rest**: Data stored in S3, Timestream, and DynamoDB is encrypted using AWS KMS (Key Management Service). So even if someone gets access to the storage, they can’t read the data.

### **IAM Roles**
- **Least Privilege**: Each service (like Lambda or Firehose) has an IAM role with just enough permissions to do its job—nothing more.
- **Role-Based Access**: For example, Lambda can only write to Timestream, and Firehose can only write to S3. This limits the damage if something goes wrong.

### **CloudTrail**
- **Auditing**: AWS CloudTrail logs all API calls, so we have a detailed record of who did what and when. This is great for compliance and troubleshooting.

---

## 4. Cost Optimization
We’ve designed this solution to be as cost-effective as possible. Here’s how:

### **Serverless Services**
- **AWS Lambda**: It scales to zero when idle, so you only pay for the compute time you actually use.
- **Amazon Timestream**: It scales automatically based on usage, so there are no upfront costs.

### **Data Batching**
- **Kinesis Firehose**: It batches data every 5 minutes or 5 MB, which reduces S3 PUT costs by up to 90%. That’s a huge saving!

### **Efficient Storage**
- **Parquet Format**: Data is stored in Parquet format in S3, which reduces storage costs and makes queries faster and cheaper with Athena.

### **Pay-as-You-Go**
- **Amazon Athena**: You only pay for the queries you run, which makes it super cost-effective for historical analysis.

---

## 5. Scalability & Fault Tolerance
This solution is built to handle growth and keep running smoothly, no matter what:

### **Scalability**
- **Kinesis Data Streams**: It scales with shards to handle high data volumes. So, as more data comes in, it just keeps going.
- **AWS Lambda**: It scales automatically with concurrency, so even during peak loads, everything keeps running smoothly.
- **Amazon Timestream**: It scales automatically to handle large volumes of time-series data. No need to worry about running out of space.

### **Fault Tolerance**
- **Amazon S3**: It provides 99.999999999% (11 nines) durability, so your data is safe no matter what.
- **AWS CloudWatch**: It monitors system health and triggers alerts if something goes wrong (like Lambda failures or Kinesis throughput issues).
- **Multi-AZ Deployment**: Services like Kinesis and Lambda are inherently fault-tolerant, with automatic failover across Availability Zones (AZs). So, if one zone goes down, another takes over seamlessly.

---

## 6. Bonus: Data Batching Solution
To make this solution even better, we’ve included a **data batching mechanism** to optimize performance and cost:

### **How It Works**
- **Kinesis Firehose**: It batches data every 5 minutes or 5 MB (whichever comes first) before writing it to S3.
- **AWS Glue**: It transforms raw JSON data into Parquet format, which reduces storage costs and makes querying faster.

### **Cost Impact**
- **S3 PUT Requests**: Batching reduces the number of S3 PUT requests by up to 90%, which saves a lot of money.
- **Athena Queries**: Parquet format reduces the amount of data scanned by Athena, cutting query costs by up to 40%.

---

## 7. Free Tier Limitations and Cost Considerations
While this architecture is designed to be cost-effective, some components (like **Kinesis Data Streams**, **Kinesis Firehose**, and **AWS Glue**) aren’t fully covered by the AWS Free Tier. These services are essential for **real-time processing**, **scalability**, and **efficient data transformation**, but they might cost a bit more.

### **Cost Optimization Strategies**
- **Serverless Services**: Services like AWS Lambda and Amazon Timestream scale to zero when idle, so you only pay for what you use.
- **Data Batching**: Kinesis Firehose batches data to S3, which reduces the number of PUT requests and saves money.
- **Efficient Storage**: Data is stored in Parquet format in S3, which reduces storage costs and makes queries faster and cheaper.

### **Alternative Free-Tier-Friendly Architecture**
If you’re working within the Free Tier, you can simplify the architecture:
- Replace **Amazon Timestream** with **Amazon DynamoDB** for time-series data storage.
- Skip **AWS Glue** and **Amazon Athena** and use manual ETL processes or lightweight query tools.
- Use **Amazon S3** for both raw and processed data storage.

However, the current architecture is designed for **production-grade scalability** and **real-time performance**, which justifies the use of non-Free-Tier services.