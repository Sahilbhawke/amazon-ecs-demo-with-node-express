provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = "us-east-2"
  version    = ">= 2.0.0"
}

terraform {
  backend "s3" {
    bucket = "node-calc"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
  required_version = ">=1.0.0"
}