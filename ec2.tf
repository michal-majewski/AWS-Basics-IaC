resource "aws_instance" "load-balanced-web-app" {
  ami           = "ami-0b5c00c0109ecef42"
  instance_type = "t2.micro"

  key_name               = aws_key_pair.ec2-key.key_name
  vpc_security_group_ids = [aws_security_group.ec2-access.id]

  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name

  user_data = <<-EOT
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              cd /var/www/html
              aws s3 sync s3://${resource.aws_s3_bucket.web-app.bucket} ./
              EOT


  tags = {
    Name = var.mentoring_program_prefix
  }
}

resource "aws_security_group" "ec2-access" {
  name_prefix = var.mentoring_program_prefix

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.my_ip}/32"]
  }

  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_key_pair" "ec2-key" {
  key_name   = "ec2-key"
  public_key = var.ec2_ssh_pub_key
}

resource "aws_iam_instance_profile" "ec2-profile" {
  name = "ec2-profile"
  role = aws_iam_role.ReadAccessRoleS3.name
}
