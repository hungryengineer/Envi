terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "vpc.tfstate"
    region = "ap-northeast-1"
  }
}