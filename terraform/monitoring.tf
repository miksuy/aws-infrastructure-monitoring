# SNS topic for monitoring alerts
resource "aws_sns_topic" "monitoring_alerts" {
  name = "monitoring-alerts"

  tags = {
    Project = "aws-infrastructure-monitoring"
  }
}

# Email subscription for alerts
resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.monitoring_alerts.arn
  protocol  = "email"
  endpoint  = var.alert_email
}

# CloudWatch alarm for high CPU utilization
resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "monitoring-server-high-cpu"
  alarm_description   = "Triggers when EC2 CPU utilization exceeds 70% for 5 minutes."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    InstanceId = aws_instance.monitoring_server.id
  }

  alarm_actions = [aws_sns_topic.monitoring_alerts.arn]
  ok_actions    = [aws_sns_topic.monitoring_alerts.arn]
}