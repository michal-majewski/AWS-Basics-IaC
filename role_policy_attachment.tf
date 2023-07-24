resource "aws_iam_role_policy_attachment" "FullAccessEC2" {
  role       = aws_iam_role.FullAccessRoleEC2.name
  policy_arn = aws_iam_policy.FullAccessPolicyEC2.arn

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "FullAccessS3" {
  role       = aws_iam_role.FullAccessRoleS3.name
  policy_arn = aws_iam_policy.FullAccessPolicyS3.arn

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_role_policy_attachment" "ReadAccessS3" {
  role       = aws_iam_role.ReadAccessRoleS3.name
  policy_arn = aws_iam_policy.ReadAccessPolicyS3.arn

  lifecycle {
    prevent_destroy = true
  }
}