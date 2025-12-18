variable "region_vpc1" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "us-west-2"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to use for Terraform state storage."
  type        = string
  default     = "my-unique-terraform-bucket-12345"
}