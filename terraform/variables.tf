variable "aws_region" {
  description = "AWS region for the monitoring infrastructure"
  type        = string
  default     = "eu-north-1"
}
variable "alert_email" {
  description = "Email address for CloudWatch alerts"
  type        = string
}