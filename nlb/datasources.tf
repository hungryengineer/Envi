data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    
    bucket = "awspoc-hyperion"
    key    = "vpc.tfstate"
    region = "ap-northeast-1"
   }
}