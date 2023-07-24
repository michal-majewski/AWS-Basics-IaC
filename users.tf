resource "aws_iam_user" "CloudX_FullEC2" {
  name = "${var.mentoring_program_prefix}-full-ec2"
  path = var.mentoring_program_path

  tags = {
    tag-key = var.mentoring_program_prefix
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_user" "CloudX_FullS3" {
  name = "${var.mentoring_program_prefix}-full-s3"
  path = var.mentoring_program_path

  tags = {
    tag-key = var.mentoring_program_prefix
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_user" "CloudX_ReadS3" {
  name = "${var.mentoring_program_prefix}-read-s3"
  path = var.mentoring_program_path

  tags = {
    tag-key = var.mentoring_program_prefix
  }

  lifecycle {
    prevent_destroy = true
  }
}
