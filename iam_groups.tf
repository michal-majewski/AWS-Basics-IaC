resource "aws_iam_group" "CoordinatorGroup" {
  name = "CoordinatorGroup"
  path = "/${var.mentoring_program_prefix}/"
}

resource "aws_iam_group" "MentorsGroup" {
  name = "MentorsGroup"
  path = "/${var.mentoring_program_prefix}/"
}

resource "aws_iam_group" "MenteesGroup" {
  name = "MenteesGroup"
  path = "/${var.mentoring_program_prefix}/"
}
