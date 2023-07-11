resource "aws_iam_user_policy" "WriteAccessForFullEC2" {
  name = "S3WriteAcessForFullEC2User"
  user = aws_iam_user.CloudX_FullEC2.name

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:CreateAccessPoint",
          "s3:SubmitMultiRegionAccessPointRoutes",
          "s3:PutAnalyticsConfiguration",
          "s3:PutAccelerateConfiguration",
          "s3:PutAccessPointConfigurationForObjectLambda",
          "s3:DeleteObjectVersion",
          "s3:PutStorageLensConfiguration",
          "s3:RestoreObject",
          "s3:DeleteAccessPoint",
          "s3:CreateBucket",
          "s3:DeleteAccessPointForObjectLambda",
          "s3:ReplicateObject",
          "s3:PutEncryptionConfiguration",
          "s3:DeleteBucketWebsite",
          "s3:AbortMultipartUpload",
          "s3:PutLifecycleConfiguration",
          "s3:UpdateJobPriority",
          "s3:DeleteObject",
          "s3:CreateMultiRegionAccessPoint",
          "s3:DeleteBucket",
          "s3:PutBucketVersioning",
          "s3:PutIntelligentTieringConfiguration",
          "s3:PutMetricsConfiguration",
          "s3:PutBucketOwnershipControls",
          "s3:DeleteMultiRegionAccessPoint",
          "s3:PutObjectLegalHold",
          "s3:InitiateReplication",
          "s3:UpdateJobStatus",
          "s3:PutBucketCORS",
          "s3:PutInventoryConfiguration",
          "s3:PutObject",
          "s3:PutBucketNotification",
          "s3:DeleteStorageLensConfiguration",
          "s3:PutBucketWebsite",
          "s3:PutBucketRequestPayment",
          "s3:PutObjectRetention",
          "s3:PutBucketLogging",
          "s3:CreateAccessPointForObjectLambda",
          "s3:PutBucketObjectLockConfiguration",
          "s3:ReplicateDelete"
        ],
        "Resource" : "*"
      }
    ]
  })
}
