resource "aws_iam_policy" "my_s3_policy" {
  name        = "my_s3_policy"
  description = "IAM policy for S3 bucket access"
  policy      = templatefile("${path.module}/policy.json.tpl", {
    bucket_name = aws_s3_bucket.my_bucket.bucket
  })
  
}