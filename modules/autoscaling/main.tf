data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

resource "aws_launch_template" "this" {

  name = "cloudforge-launch-template"

  image_id = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  vpc_security_group_ids = [
    var.ec2_security_group_id
  ]

  iam_instance_profile {
    name = var.instance_profile_name
  }

  user_data = base64encode(<<EOF
#!/bin/bash

dnf update -y
dnf install nginx -y

systemctl enable nginx
systemctl start nginx

echo "<h1>CloudForge Infrastructure</h1>" > /usr/share/nginx/html/index.html
EOF
)

  tag_specifications {

    resource_type = "instance"

    tags = {
      Name = "cloudforge-web"
    }
  }
}

resource "aws_autoscaling_group" "this" {

  name = "cloudforge-asg"

  desired_capacity = 2

  min_size = 2

  max_size = 4

  vpc_zone_identifier = [
    var.public_subnet_1_id,
    var.public_subnet_2_id
  ]

  target_group_arns = [
    var.target_group_arn
  ]

  health_check_type = "ELB"

  launch_template {

    id = aws_launch_template.this.id

    version = "$Latest"
  }

  tag {

    key = "Name"

    value = "cloudforge-asg-instance"

    propagate_at_launch = true
  }
}
