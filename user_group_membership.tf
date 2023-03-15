resource "aws_iam_user_group_membership" "Full_EC2" {
  user = aws_iam_user.CloudX_FullEC2.name

  groups = [
    aws_iam_group.FullAccessGroupEC2.name
  ]
}

resource "aws_iam_user_group_membership" "Full_S3" {
  user = aws_iam_user.CloudX_FullS3.name

  groups = [
    aws_iam_group.FullAccessGroupS3.name
  ]
}

resource "aws_iam_user_group_membership" "Read_S3" {
  user = aws_iam_user.CloudX_ReadS3.name

  groups = [
    aws_iam_group.ReadAccessGroupS3.name
  ]
}
