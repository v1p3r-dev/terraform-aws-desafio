resource "aws_launch_template" "main" {
  name_prefix   = "${var.project_name}-lt-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.main.key_name

  user_data = base64encode(<<-EOF
#!/bin/bash
dnf update -y
dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat <<HTML >/var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform AWS Challenge</title>
</head>
<body>
    <h1>Terraform AWS Challenge</h1>
    <p>EC2 criada automaticamente pelo Auto Scaling Group.</p>
</body>
</html>
HTML
EOF
  )


  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_profile.name
  }

  network_interfaces {
    associate_public_ip_address = true

    security_groups = [
      aws_security_group.public_sg.id
    ]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.project_name}-ec2"
    }
  }
}

resource "aws_autoscaling_group" "main" {
  name = "${var.project_name}-asg"

  desired_capacity = 2
  min_size         = 2
  max_size         = 4

  vpc_zone_identifier = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.ec2.arn
  ]

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }

  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "${var.project_name}-ec2"
    propagate_at_launch = true
  }
}
