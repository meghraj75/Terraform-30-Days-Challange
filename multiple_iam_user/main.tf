resource "aws_iam_user" "name" {
  for_each= {for user in local.user : user.Name => user}  
  name = lower("${substr(each.value.Name, 0, 1)}${each.value.Surname}")
  path = "/user/"  # specify the path for the IAM user inside aWS account
  tags = {
    Name = "${each.value.Name} ${each.value.Surname}"
    Department = each.value.Department
    JobRole = each.value.JobTitle
  }
}

resource "aws_iam_user_login_profile" "login_profile" {
  for_each = aws_iam_user.name
  user = each.value.name
  password_reset_required = true
 lifecycle {
   ignore_changes = [ password_reset_required ,password_length ]
 }
}