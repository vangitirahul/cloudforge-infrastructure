# CloudForge Infrastructure

## Overview

CloudForge Infrastructure is a production-style AWS Infrastructure as Code (IaC) project built using Terraform.

The project demonstrates how to provision, manage, monitor, and maintain AWS infrastructure using reusable Terraform modules and industry-standard practices.

The infrastructure includes networking, security, compute, load balancing, auto scaling, monitoring, alerting, remote state management, and version control.

---

## Architecture

```text
Internet
    │
    ▼
Application Load Balancer
    │
    ▼
Target Group
    │
    ▼
Auto Scaling Group
    │
 ┌──┴──┐
 ▼     ▼
EC2   EC2
(Nginx)

────────────────────────

CloudWatch
    │
    ▼
SNS
    │
    ▼
Email Notification

────────────────────────

Terraform Backend

S3 State Storage
      +
DynamoDB State Locking
```

---

## Features

* Modular Terraform Architecture
* AWS VPC with Public Subnets
* Internet Gateway and Route Tables
* Security Groups
* IAM Roles and Instance Profiles
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Launch Templates
* EC2 Automated Provisioning
* Nginx Deployment using User Data
* CloudWatch Monitoring
* SNS Email Alerting
* Remote Terraform State using Amazon S3
* Terraform State Locking using DynamoDB
* Git Version Control
* GitHub Repository Management

---

## AWS Services Used

* Amazon VPC
* Amazon EC2
* Amazon IAM
* Amazon S3
* Amazon DynamoDB
* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* Amazon CloudWatch
* Amazon SNS

---

## Project Structure

```text
cloudforge/

├── backend/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
├── environments/
│   └── dev/
│       ├── backend.tf
│       ├── main.tf
│       ├── outputs.tf
│       ├── provider.tf
│       ├── variables.tf
│       └── versions.tf
│
├── modules/
│   ├── vpc/
│   ├── security_group/
│   ├── iam/
│   ├── alb/
│   ├── autoscaling/
│   └── cloudwatch/
│
├── .gitignore
└── README.md
```

---

## Infrastructure Components

### VPC

* Custom VPC
* Public Subnet 1
* Public Subnet 2
* Internet Gateway
* Route Tables

### Security

* ALB Security Group
* EC2 Security Group
* Restricted SSH Access

### IAM

* EC2 IAM Role
* Instance Profile
* CloudWatch Policy Attachment

### Load Balancing

* Application Load Balancer
* Target Group
* Listener Configuration

### Compute

* Launch Template
* Auto Scaling Group
* EC2 Instances
* User Data Automation

### Monitoring

* CloudWatch CPU Alarm
* SNS Email Notification
* Alert Validation

---

## Terraform Backend

### Amazon S3

Used for storing Terraform remote state.

Benefits:

* Centralized state management
* Durable storage
* Team collaboration

### DynamoDB

Used for Terraform state locking.

Benefits:

* Prevents concurrent modifications
* Protects state integrity
* Avoids state corruption

---

## Monitoring and Alerting

### CloudWatch Alarm

Monitored Metric:

* EC2 CPU Utilization

Alarm Configuration:

* Threshold: 70%
* Evaluation Periods: 2
* Period: 120 Seconds

### SNS Notification

When CPU utilization exceeds the configured threshold:

```text
CloudWatch Alarm
        ↓
SNS Topic
        ↓
Email Notification
```

---

## Monitoring Validation

The monitoring workflow was successfully tested.

Steps performed:

1. Connected to EC2 instance using SSH.
2. Installed the stress utility.
3. Generated high CPU utilization.
4. CloudWatch alarm entered ALARM state.
5. SNS email notification was received successfully.

This validated the complete monitoring and alerting workflow.

---

## Deployment Workflow

### Step 1

Deploy backend resources.

```bash
cd backend

terraform init
terraform plan
terraform apply
```

### Step 2

Initialize remote backend.

```bash
cd environments/dev

terraform init -reconfigure
```

### Step 3

Deploy infrastructure.

```bash
terraform plan
terraform apply
```

### Step 4

Verify infrastructure.

```bash
terraform output
```

---

## Skills Demonstrated

* Infrastructure as Code (IaC)
* AWS Networking
* Security Best Practices
* Auto Scaling
* Monitoring and Alerting
* Git and GitHub
* Cloud Operations

---

## Future Enhancements
* HTTPS using ACM
* Route53 Integration
* GitHub Actions CI/CD Pipeline
* Multi-Environment Deployment
* Terraform Workspaces
* CloudWatch Dashboards

---


Rahul Vangiti

Cloud & DevOps Engineer
## Author

* Infrastructure Automation
* Load Balancing

