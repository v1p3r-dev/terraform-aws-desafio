resource "aws_instance" "public" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.public_1.id

  vpc_security_group_ids = [
    aws_security_group.public_sg.id
  ]

  associate_public_ip_address = true

  key_name = aws_key_pair.main.key_name

  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = <<-EOF
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
    <p>EC2 criada automaticamente pelo Terraform.</p>
</body>
</html>
HTML
EOF

  tags = {
    Name = "${var.project_name}-ec2-public"
  }
}

resource "aws_key_pair" "main" {
  key_name   = "${var.project_name}-key"
  public_key = file(var.public_key_path)
}
