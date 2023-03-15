data "aws_iam_policy_document" "FullAccessEC2" {
  statement {
    actions   = ["ec2:*"]
    resources = ["arn:aws:ec2:::*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "FullAccessS3" {
  statement {
    actions   = ["s3:*"]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "ReadAccessS3" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    resources = ["arn:aws:s3:::*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "EC2_Assume_Role_Policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
