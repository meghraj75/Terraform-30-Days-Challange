locals {
  website_files = fileset("${path.module}/website", "**/*")
}