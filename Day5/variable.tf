
variable "region" {
    type = string
}

variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "tags" {
    type = map(string)
  description = "tags to apply for s3"
}

variable "ami_id" {
  type = string
  description = "created ami id "
}

variable "allowd_ports" {
  type = list(number)
  default = [ 22,80 ]
}
