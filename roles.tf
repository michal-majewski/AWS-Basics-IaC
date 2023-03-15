resource "aws_iam_role" "FullAccessRoleEC2" {
  name               = "${var.mentoring_program_prefix}-FullAccessRoleEC2"
  path               = var.mentoring_program_path
  assume_role_policy = data.aws_iam_policy_document.EC2_Assume_Role_Policy.json
}

resource "aws_iam_role" "FullAccessRoleS3" {
  name               = "${var.mentoring_program_prefix}-FullAccessRoleS3"
  path               = var.mentoring_program_path
  assume_role_policy = data.aws_iam_policy_document.EC2_Assume_Role_Policy.json
}

resource "aws_iam_role" "ReadAccessRoleS3" {
  name               = "${var.mentoring_program_prefix}-ReadAccessRoleS3"
  path               = var.mentoring_program_path
  assume_role_policy = data.aws_iam_policy_document.EC2_Assume_Role_Policy.json
}
