
variable "group_policies" {
  description = "Map of IAM user roles and user counts"
  type        = map(number)
  default = {
    system_admin    = 3
    database_admin  = 3
    read_only       = 3
  }
}

variable "group_policy_map" {
  description = "Map of groups and policies"
  type        = map(string)
  default = {
      system_admin   = "arn:aws:iam::aws:policy/AdministratorAccess"
      database_admin = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
      read_only      = "arn:aws:iam::aws:policy/AmazonConnectReadOnlyAccess"
  }
}

variable "env_type" {
  type = string
}

