terraform {
  backend "s3" {
    bucket       = "my-unique-terraform-bucket-12345"
    key          = "state/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
