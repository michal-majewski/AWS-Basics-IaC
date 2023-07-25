resource "aws_s3_bucket" "web-app" {
  bucket = "${var.mentoring_program_prefix}-web-app-${var.my_name}"

  tags = {
    tag-key = var.mentoring_program_prefix
  }
}

resource "aws_s3_bucket_website_configuration" "web-hosting" {
  bucket = aws_s3_bucket.web-app.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "AllowMeToReadBucket" {
  bucket = aws_s3_bucket.web-app.id
  policy = data.aws_iam_policy_document.S3ForMyIp.json
}

resource "aws_s3_bucket_public_access_block" "S3WebHostingPublicAccess" {
  bucket = aws_s3_bucket.web-app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

data "aws_iam_policy_document" "S3ForMyIp" {
  statement {
    sid    = "AllowGetObj"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${resource.aws_s3_bucket.web-app.bucket}/*"]
    condition {
      test     = "IpAddress"
      variable = "aws:SourceIp"
      values   = ["${var.my_ip}"]
    }
  }

  statement {
    sid    = "DenyGetObj"
    effect = "Deny"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${resource.aws_s3_bucket.web-app.bucket}/*"]
    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"
      values   = ["${var.my_ip}"]
    }
  }
}
