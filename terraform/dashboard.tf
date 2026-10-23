resource "aws_cloudwatch_dashboard" "monitoring" {
  dashboard_name = "Infrastructure-Monitoring"

  dashboard_body = jsonencode({
    widgets = [
      {
        type   = "metric"
        x      = 0
        y      = 0
        width  = 12
        height = 6

        properties = {
          metrics = [
            [
              "AWS/EC2",
              "CPUUtilization",
              "InstanceId",
              aws_instance.monitoring_server.id
            ]
          ]

          period = 300
          stat   = "Average"
          region = var.aws_region
          title  = "EC2 CPU Utilization"
          view   = "timeSeries"
        }
      }
    ]
  })
}