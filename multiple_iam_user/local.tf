locals {
  user=csvdecode(file("user.csv"))  #local variable to read csv file convert entire content of csv to list of map 
}

locals {
  job_role=distinct([
    for user in local.user :user.JobTitle
  ])
}