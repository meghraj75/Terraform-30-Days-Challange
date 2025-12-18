output "names" {
  value = [for user in local.user : "${user.Name} ${user.Surname}"]
}

output "iam_user_paths" {
  value = {
    for k, u in aws_iam_user.name :
    k => u.path
  }
}
