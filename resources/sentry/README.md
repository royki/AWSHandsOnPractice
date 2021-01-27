# Terraform script

- You need to have an existing key pair file of ec2 instance in `us-east-1` region
  - Update `key_name = "UPDATE_KEY_PAIR_NAME"`
- Launce AWS EC2 Instance
  - `terraform init`
  - `terraform plan`
  - `terraform apply` or `terraform apply --auto-approve`
- Destroy AWS EC2 Instance
  - `terraform destroy`or `terraform destroy --auto-approve`

---

- This Terraform Script uses default VPC, IG, RT.
- It doesn't create any Elastic IP. The generated Public IP is not permanent. i.e. If the launched EC2 instance is destroyed, IP shall be lost as well.
