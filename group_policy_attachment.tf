resource "aws_iam_group_policy_attachment" "FullAccessGroupEC2" {
  group      = aws_iam_group.FullAccessGroupEC2.name
  policy_arn = aws_iam_policy.FullAccessPolicyEC2.arn

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group_policy_attachment" "FullAccessGroupS3" {
  group      = aws_iam_group.FullAccessGroupS3.name
  policy_arn = aws_iam_policy.FullAccessPolicyS3.arn

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group_policy_attachment" "ReadAccessGroupS3" {
  group      = aws_iam_group.ReadAccessGroupS3.name
  policy_arn = aws_iam_policy.ReadAccessPolicyS3.arn

  lifecycle {
    prevent_destroy = true
  }
}
