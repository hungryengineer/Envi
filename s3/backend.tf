terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "s3.tfstate"
    region = "ap-northeast-1"
  }
}