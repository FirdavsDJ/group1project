locals {
  users = merge([
    for role, count in var.group_policies :
    {
      for i in range(count) :
      "${role}_${i + 1}" => role
    }
  ]...)
}

