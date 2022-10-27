data "terraform_remote_state" "cloudwatch" {
  backend = "s3"
  config = {
    
    bucket = "awspoc-hyperion"
    key    = "cloudwatch.tfstate"
    region = "ap-northeast-1"
   }
}