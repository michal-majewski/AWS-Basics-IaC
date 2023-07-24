resource "aws_iam_group" "CoordinatorGroup" {
  name = "CoordinatorGroup"
  path = var.mentoring_program_path

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group" "MentorsGroup" {
  name = "MentorsGroup"
  path = var.mentoring_program_path

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group" "MenteesGroup" {
  name = "MenteesGroup"
  path = var.mentoring_program_path

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group" "FullAccessGroupEC2" {
  name = "FullAccessGroupEC2"
  path = var.mentoring_program_path

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group" "FullAccessGroupS3" {
  name = "FullAccessGroupS3"
  path = var.mentoring_program_path

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_iam_group" "ReadAccessGroupS3" {
  name = "ReadAccessGroupS3"
  path = var.mentoring_program_path

  lifecycle {
    prevent_destroy = true
  }
}
