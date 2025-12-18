data "aws_iam_policy_document" "terraform_state_policy" {

  statement {
    sid    = "TerraformStateObjectAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::ACCOUNT_ID:role/TerraformExecutionRole"
      ]
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject"
    ]

    resources = [
      "arn:aws:s3:::my-unique-terraform-bucket-12345/state/*"
    ]
  }

  statement {
    sid    = "TerraformStateListBucket"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::ACCOUNT_ID:role/TerraformExecutionRole"
      ]
    }

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      "arn:aws:s3:::my-unique-terraform-bucket-12345"
    ]
  }
}
