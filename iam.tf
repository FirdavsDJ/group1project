resource "aws_iam_group" "groups" {
  for_each = var.group_policy_map
  name     = "${each.key}_group"
}

resource "aws_iam_user" "users" {
  for_each = local.users
  name     = each.key
}

resource "aws_iam_user_group_membership" "memberships" {
  for_each = local.users

  user   = aws_iam_user.users[each.key].name
  groups = [aws_iam_group.groups[each.value].name]
}

resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each   = var.group_policy_map

  group      = aws_iam_group.groups[each.key].name
  policy_arn = each.value
}

