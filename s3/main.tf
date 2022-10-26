module "s3" {
  source = "git::https://github.com/hungryengineer/mod.git//s3?ref=feature"
  bucket_name                = var.bucket_name
  force_destroy              = var.force_destroy
  object_lock_enabled        = var.object_lock_enabled
  mode                       = var.mode
  days                       = var.days
  versioning                 = var.versioning
#   tiering                    = var.tiering
  tags                       = local.tags
}