# group defination
resource "aws_iam_group" "administrators" {
    name = "administrators"
}

# attach an IAM policy to an IAM group
resource "aws_iam_policy_attachment" "administrators-attach" {
    name = "administrators-attach"
    groups = [aws_iam_group.administrators.name]
    policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

# user
resource "aws_iam_user" "admin1" {
    name = "admin1"
}

resource "aws_iam_user" "admin2" {
    name = "admin2"
}

# creates an IAM group membership resource in AWS
resource "aws_iam_group_membership" "administrators-users" {
    name = "administrators-users"
    users = [
        aws_iam_user.admin1.name,
        aws_iam_user.admin2.name
    ]
    group = aws_iam_group.administrators.name
}

output "warning" {
    value = "WARNING: make sure you're not using the AdministratorAccess policy for other user/groups/roles."
}
