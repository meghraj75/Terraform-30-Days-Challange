locals {
    bucket_name=lower(format("%s-%s-%s",var.project_name,var.environment,var.region))
    
}

locals {
  cidr_list= ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    first_subnet   = element(local.cidr_list, 0)
  last_subnet    = element(local.cidr_list, length(local.cidr_list) - 1)
  first_two_subs = slice(local.cidr_list, 0, 2)
}

