- MFA is part of AWS's best practices for IAM account security. Multi-Factor Authentication (MFA) is an important part of account security that should be set on your "root" account.
- IAM policies can be directly attached to IAM roles, users and groups. IAM policies can only be applied to other AWS services (indirectly) through IAM roles.
- If a user has access to S3 through a group with an S3 policy attached, what happens if that user is removed from the group? The use no longer has access to S3
- IAM is where you manage your AWS users and their access to AWS features and services.
- You can only assign permissions another AWS service through IAM roles (with a policy attached to the role)
    + If you want to grant S3 access to an EC2 instance, - Create an EC2 Role and attach with S3 access policy to it.


