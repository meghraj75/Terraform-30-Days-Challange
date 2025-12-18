AWS Caller Identity refers to who is making an AWS API request.

In AWS, this is usually checked using STS (Security Token Service).

What does AWS Caller Identity mean?

It identifies:

Account ID – which AWS account the request belongs to

User / Role / Assumed Role – who is calling (IAM user, IAM role, EC2 role, Lambda role, etc.)

ARN – the unique AWS identity string
-------------------------------------------------------------------------------------

An IAM user profile login refers to an IAM user signing in to the AWS Management Console using a username and password that belongs to that IAM user.


----------------------------------------------------------------------------------------

What does aws_iam_group mean?

aws_iam_group is a Terraform resource used to create and manage an IAM Group in AWS.

An IAM Group is a way to organize IAM users and assign permissions to them collectively instead of one by one.

In simple words

👤 IAM User → individual person / identity

👥 IAM Group → collection of users

📜 Policies → permissions (what they can access)

➡️ You attach policies to a group, then add users to that group.