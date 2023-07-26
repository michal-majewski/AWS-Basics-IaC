data "aws_iam_policy_document" "FullAccessEC2" {
  statement {
    actions   = ["ec2:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "FullAccessS3" {
  statement {
    actions   = ["s3:*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "ReadAccessS3" {
  statement {
    actions   = ["s3:Get*", "s3:List*"]
    resources = ["*"]
    effect    = "Allow"
  }
}

data "aws_iam_policy_document" "EC2_Assume_Role_Policy" {
  statement {
    actions = ["sts:AssumeRole"]

    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
