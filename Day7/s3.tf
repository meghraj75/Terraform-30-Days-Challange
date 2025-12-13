resource "aws_s3_bucket" "static_bucket" {
  bucket = "${var.project_name}-${var.environment}-bucket"


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "allow_oac" {
  bucket = aws_s3_bucket.static_bucket.id
  policy = data.aws_iam_policy_document.s3_policy.json
  depends_on = [
    aws_s3_bucket_ownership_controls.ownership,
    aws_s3_bucket_public_access_block.bucket_policy
  ]
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
     bucket = aws_s3_bucket.static_bucket.id
    rule {
      object_ownership = "BucketOwnerEnforced"
    }
  
}

resource "aws_s3_bucket_public_access_block" "bucket_policy" {
  bucket = aws_s3_bucket.static_bucket.id
 block_public_acls = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "site_files" {
  for_each = local.website_files

  bucket = aws_s3_bucket.static_bucket.id
  key    = each.value
  source = "${path.module}/website/${each.value}"

  content_type = lookup({
    html = "text/html"
    css  = "text/css"
    js   = "application/javascript"
  }, regex("\\.(\\w+)$", each.value)[0], "binary/octet-stream")

#  etag changed → update required
  etag = filemd5("${path.module}/website/${each.value}")
}