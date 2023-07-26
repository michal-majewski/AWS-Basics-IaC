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

resource "aws_s3_bucket_versioning" "S3BucketWebAppVersionEnabled" {
  bucket = aws_s3_bucket.web-app.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_versioning" "S3BucketReplicaVersionEnabled" {
  bucket = aws_s3_bucket.replica.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "replica" {
  bucket = "${var.mentoring_program_prefix}-web-app-replication-${var.my_name}"

  tags = {
    tag-key = var.mentoring_program_prefix
  }
}


resource "aws_iam_role" "replication" {
  name               = "${var.mentoring_program_prefix}-ReplicationS3"
  path               = var.mentoring_program_path
  assume_role_policy = data.aws_iam_policy_document.S3_Assume_Role_Policy.json

  tags = {
    tag-key = var.mentoring_program_prefix
  }
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

data "aws_iam_policy_document" "S3_Assume_Role_Policy" {
  statement {
    actions = ["sts:AssumeRole"]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "replication" {
  statement {
    effect = "Allow"

    actions = [
      "s3:GetReplicationConfiguration",
      "s3:ListBucket",
    ]

    resources = [aws_s3_bucket.web-app.arn]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:GetObjectVersionForReplication",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
    ]

    resources = ["${aws_s3_bucket.web-app.arn}/*"]
  }

  statement {
    effect = "Allow"

    actions = [
      "s3:ReplicateObject",
      "s3:ReplicateDelete",
      "s3:ReplicateTags",
    ]

    resources = ["${aws_s3_bucket.replica.arn}/*"]
  }
}

resource "aws_iam_policy" "replication" {
  name   = "${var.mentoring_program_prefix}-Replication"
  path   = var.mentoring_program_path
  policy = data.aws_iam_policy_document.replication.json
}

resource "aws_iam_role_policy_attachment" "replication" {
  role       = aws_iam_role.replication.name
  policy_arn = aws_iam_policy.replication.arn
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  provider = aws.my-provider
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.S3BucketWebAppVersionEnabled]

  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.web-app.id

  rule {
    filter {
      prefix = "replication-note"
    }

    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.replica.arn
      storage_class = "STANDARD"
    }

    delete_marker_replication {
      status = "Enabled"
    }
  }
}
