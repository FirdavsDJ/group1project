

# Create IAM Groups
resource "aws_iam_group" "groups" {
  for_each = var.group_policy_map
  name     = "${each.key}_group"
}

# Create IAM Users
resource "aws_iam_user" "users" {
  for_each = { for role, count in var.user_map : 
    for i in range(count) : 
    "${role}_${i + 1}" => role
  }
  name = each.key
}

# Add Users to Groups
resource "aws_iam_user_group_membership" "group_membership" {
  for_each = aws_iam_user.users

  user = each.value.name
  groups = [
    aws_iam_group.groups[each.value].name
  ]
}

# Attach Policies to Groups
resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each = var.group_policy_map

  group      = aws_iam_group.groups[each.key].name
  policy_arn = each.value
}

