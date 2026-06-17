module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = "10.10.0.0/16"
  public_subnet_1_cidr = "10.10.1.0/24"
  public_subnet_2_cidr = "10.10.2.0/24"

  az_1 = "ap-south-1a"
  az_2 = "ap-south-1b"
}

module "security_group" {
  source = "../../modules/security_group"

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "../../modules/iam"
}

module "alb" {

  source = "../../modules/alb"

  vpc_id = module.vpc.vpc_id

  public_subnet_1_id = module.vpc.public_subnet_1_id

  public_subnet_2_id = module.vpc.public_subnet_2_id

  alb_security_group_id = module.security_group.alb_security_group_id
}

module "autoscaling" {
  source = "../../modules/autoscaling"

  public_subnet_1_id = module.vpc.public_subnet_1_id
  public_subnet_2_id = module.vpc.public_subnet_2_id

  ec2_security_group_id = module.security_group.ec2_security_group_id

  instance_profile_name = module.iam.instance_profile_name

  key_name = "cloudforge-key"

  target_group_arn = module.alb.target_group_arn
}

module "cloudwatch" {

  source = "../../modules/cloudwatch"

  notification_email = "vangitirahul2002@gmail.com"

  autoscaling_group_name = module.autoscaling.autoscaling_group_name
}
