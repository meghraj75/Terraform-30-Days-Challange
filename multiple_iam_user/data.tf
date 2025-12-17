data "aws_caller_identity" "ac_identity" {}

output "account_id" {
  value = data.aws_caller_identity.ac_identity.account_id
}