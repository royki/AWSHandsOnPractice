# Setup local environment

- Using awscli - `aws configure`

```shell
AWS Access Key ID [None]: UPDATE_USER_ACCESS_KEY
AWS Secret Access Key [None]: UPDATE_USER_SECRET_KEY
Default region name [None]: SETUP_DEFAULT_REGION_NAME
Default output format [None]: SETUP_DEFAULT_FORMAT(json)
```

## Terraform Command

- `terraform init`
- `terraform plan`
- `terraform apply`
- `terraform apply -taget TARGET_NAME`
- `terraform apply -var "VAR_NAME=VALUE"`
- `terraform apply -var-files=filename.tfvars`
- `terraform apply --auto-approve`
- `terraform refresh`
- `terraform destroy`
- `terraform destroy -target TARGET_NAME`
- `terrafom state list`
- `terrafom state show STATE_NAME`
