
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
 
  backend "s3" {
  bucket ="my-s3-bucket-lock123423"
  key="state/terraform.tfstate"
  region = "us-east-1"
  use_lockfile = true

}

}
provider "aws" {
 region = "us-east-1"
}



