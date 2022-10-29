terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "route53.tfstate"
    region = "ap-northeast-1"
  }
}