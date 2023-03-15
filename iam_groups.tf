resource "aws_iam_group" "CoordinatorGroup" {
  name = "CoordinatorGroup"
  path = "/cloudx/"
}

resource "aws_iam_group" "MentorsGroup" {
  name = "MentorsGroup"
  path = "/cloudx/"
}

resource "aws_iam_group" "MenteesGroup" {
  name = "MenteesGroup"
  path = "/cloudx/"
}
