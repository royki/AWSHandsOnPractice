terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"
    bucket = "backup-tf-state"
    region = "us-east-2"
    access_key = "" 
    secret_key = ""
  }
}
