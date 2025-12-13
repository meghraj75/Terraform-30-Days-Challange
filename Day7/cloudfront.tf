# Your S3 bucket stays fully private
# CloudFront signs every request to S3 using SigV4
# Only CloudFront is allowed to read content from S3
resource "aws_cloudfront_origin_access_control" "oac" {
    name = "${var.project_name}-${var.environment}-oac"
    origin_access_control_origin_type = "s3"
    signing_behavior = "always"
    signing_protocol = "sigv4"

}

resource "aws_cloudfront_distribution" "cdn" {
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_s3_bucket.static_bucket.bucket_regional_domain_name
    origin_id   = "s3-site-origin"

    s3_origin_config {
      origin_access_identity = "" # not needed for OAC
    }

    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "s3-site-origin"

    viewer_protocol_policy = "redirect-to-https"
    compress = true

    forwarded_values {        # or use cache_policy_id to fine tune
      query_string = false
      cookies { forward = "none" }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
    # later: use ACM certificate in us-east-1 and set acm_certificate_arn + ssl_support_method = "sni-only"
  }

  tags = {
    Project = "static-site"
  }
}
