provider "aws" {
  region = "us-west-1"
  shared_credentials_files = ["~/.aws/credentials"]
}

terraform {
  backend "s3" {
    bucket = "gha-tf-pj"
    key = "statefile/terraform.tfstate"
    region = "us-west-1"
  }
}