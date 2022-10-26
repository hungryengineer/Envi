terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.70.0"
    }
  }
}

provider "aws" {
  region  = "ap-northeast-1"
  shared_credentials_file = "/c/Users/kumaranshuman/.aws/credentials"
}