resource "aws_sns_topic" "alerts" {

  name = "cloudforge-alerts"
}

resource "aws_sns_topic_subscription" "email" {

  topic_arn = aws_sns_topic.alerts.arn

  protocol = "email"

  endpoint = var.notification_email
}

resource "aws_cloudwatch_metric_alarm" "cpu_high" {

  alarm_name = "cloudforge-high-cpu"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 120

  statistic = "Average"

  threshold = 70

  alarm_description = "Alarm when CPU exceeds 70 percent"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    AutoScalingGroupName = var.autoscaling_group_name
  }
}
