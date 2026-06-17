output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  value = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  value = module.vpc.public_subnet_2_id
}

output "alb_security_group_id" {
  value = module.security_group.alb_security_group_id
}

output "ec2_security_group_id" {
  value = module.security_group.ec2_security_group_id
}
output "instance_profile_name" {
  value = module.iam.instance_profile_name
}

output "iam_role_name" {
  value = module.iam.role_name
}
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "target_group_arn" {
  value = module.alb.target_group_arn
}
output "autoscaling_group_name" {
  value = module.autoscaling.autoscaling_group_name
}

output "launch_template_id" {
  value = module.autoscaling.launch_template_id
}
output "sns_topic_arn" {
  value = module.cloudwatch.sns_topic_arn
}

output "alarm_name" {
  value = module.cloudwatch.alarm_name
}
