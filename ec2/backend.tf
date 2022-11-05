terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "ec2.tfstate"
    region = "ap-northeast-1"
  }
}