terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  backend "s3" {
    bucket         = "raksit31667-terraform-state"
    key            = "production"
    region         = "ap-southeast-1"
    dynamodb_table = "TerraformStateLock"
    encrypt        = false
  }
}

provider "aws" {
  profile = "raksit31667-terraform"
  region  = "ap-southeast-1"
}

