resource "aws_iam_policy" "FullAccessPolicyEC2" {
  name   = "${var.mentoring_program_prefix}-FullAccessPolicyEC2"
  path   = var.mentoring_program_path
  policy = data.aws_iam_policy_document.FullAccessEC2.json
}

resource "aws_iam_policy" "FullAccessPolicyS3" {
  name   = "${var.mentoring_program_prefix}-FullAccessPolicyS3"
  path   = var.mentoring_program_path
  policy = data.aws_iam_policy_document.FullAccessS3.json
}

resource "aws_iam_policy" "ReadAccessPolicyS3" {
  name   = "${var.mentoring_program_prefix}-ReadAccessPolicyS3"
  path   = var.mentoring_program_path
  policy = data.aws_iam_policy_document.ReadAccessS3.json
}
