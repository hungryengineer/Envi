terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "cloudwatch.tfstate"
    region = "ap-northeast-1"
  }
}