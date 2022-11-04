terraform {
  backend "s3" {
    bucket = "awspoc-hyperion"
    key    = "ecr.tfstate"
    region = "ap-northeast-1"
  }
}