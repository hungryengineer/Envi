terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "nlb.tfstate"
    region = "ap-northeast-1"
  }
}