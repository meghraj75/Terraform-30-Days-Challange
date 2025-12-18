resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-unique-terraform-bucket-12345"

  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
  }
}
