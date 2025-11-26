
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_first_bucket" {
    bucket="my-s3-bucket-123678"
    tags ={
        Name = "My first bucket" //tags and bucket name is diff 
        Environment = "Dev"
    }
}