resource "aws_iam_group" "manager"{
    name = "Managers"
    path = "/group/"    

}

resource "aws_iam_group" "developer"{
    name = "Developers"
    path = "/group/"
  
}

resource "aws_iam_group" "job_role_groups"{
    for_each = toset(local.job_role)
    name = each.key
    path = "/group/"
}

# dynamically allocate users to respective IAM groups based on their JobRole tag
resource "aws_iam_group_membership" "managership" {
   
    for_each = toset(local.job_role)

  name = "${each.key}-membership"

  users = [
    for user in aws_iam_user.name :
    user.name
    if user.tags["JobRole"] == each.key
  ]

  group = aws_iam_group.job_role_groups[each.key].name
}





# resource "aws_iam_group_membership" "managership" {
#     name = "managership"
#     users = [for user in aws_iam_user.name : user.name if user.tags["JobRole"] == "Manager"]
#     group = aws_iam_group.manager.name
# }

# #select only those users whose JobRole tag is Developer,
# #and add them to the IAM group called developer.
# resource "aws_iam_group_membership" "developergroup" {
#     name = "developergroup"
#     users = [for user in aws_iam_user.name : user.name if user.tags["JobRole"] == "Developer"]
#     group = aws_iam_group.developer.name
# }