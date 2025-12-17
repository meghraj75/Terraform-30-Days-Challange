 resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  region = var.region_vpc1
  
  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
  }
}

terraform {
  

backend "s3" {
  bucket = var.bucket_name
  key    = "state/terraform.tfstate"
  region = var.region_vpc1
  use_lockfile = true
}
}