terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "amp.tfstate"
    region = "ap-northeast-1"
  }
}