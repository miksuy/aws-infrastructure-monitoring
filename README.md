# AWS Infrastructure Monitoring & Alerting

An AWS infrastructure monitoring project built using Terraform. The project deploys an Ubuntu EC2 instance, monitors CPU utilization with Amazon CloudWatch, and sends email notifications through Amazon SNS when an alarm is triggered.

## Architecture

The infrastructure is deployed in the AWS Europe (Stockholm) region (`eu-north-1`).

**Components:**
- **Amazon EC2:** Ubuntu Server 24.04 LTS running on a `t3.micro` instance.
- **Amazon CloudWatch:** Collects EC2 CPU metrics and evaluates a CPU utilization alarm.
- **Amazon SNS:** Distributes alarm notifications through an email subscription.
- **CloudWatch Dashboard:** Visualizes EC2 CPU utilization.
- **Terraform:** Provisions and manages the AWS infrastructure as code.

### Architecture Diagram

```text
         Ubuntu EC2 Instance
                  |
                  v
         Amazon CloudWatch
          CPU Utilization
                  |
                  v
          CloudWatch Alarm
           Threshold: 70%
                  |
                  v
             Amazon SNS
                  |
                  v
            Email Alert
```

## Features

- Infrastructure provisioning using Terraform.
- Automated deployment of an Ubuntu EC2 instance.
- CPU utilization monitoring with a CloudWatch alarm.
- Email notifications when CPU utilization exceeds 70% over a five-minute evaluation period.
- Notifications when the alarm returns to the OK state.
- CloudWatch dashboard for visualizing CPU metrics.
- Automated resource management through Terraform.

## Technologies

- Amazon Web Services (AWS)
- Terraform
- Amazon EC2
- Amazon CloudWatch
- Amazon SNS
- Ubuntu Server 24.04 LTS
- Git and GitHub

## Deployment

### Prerequisites

- An AWS account with access to the required services.
- AWS CLI installed and configured.
- Terraform installed.
- An email address for monitoring notifications.

### 1. Clone the repository

```bash
git clone https://github.com/miksuy/aws-infrastructure-monitoring.git
cd aws-infrastructure-monitoring/terraform
```

### 2. Initialize Terraform

```bash
terraform init
```

### 3. Configure the notification email

Create a local `terraform.tfvars` file:

```hcl
alert_email = "your-email@example.com"
```

The variable file is excluded from version control.

### 4. Review and deploy

```bash
terraform fmt
terraform validate
terraform plan
terraform apply
```

Review the proposed changes before approving the deployment.

### 5. Confirm the email subscription

Open the subscription confirmation email sent by Amazon SNS and confirm the subscription.

### 6. View the dashboard

Open Amazon CloudWatch in the configured AWS region and select the `Infrastructure-Monitoring` dashboard.

## Testing

The monitoring and notification workflow was tested by temporarily lowering the CloudWatch alarm threshold.

The alarm triggered and an email notification was successfully received through Amazon SNS. The alarm threshold was subsequently restored to 70%.

## Cleanup

To remove the infrastructure created by Terraform, navigate to the `terraform` directory and run:

```bash
terraform destroy
```

Review the proposed deletions before confirming.

## Project Status

**Completed.**

The EC2 instance, CloudWatch alarm, SNS email subscription, and CloudWatch dashboard were deployed successfully. The alarm notification workflow was tested successfully.