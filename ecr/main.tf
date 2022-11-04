module "ecr_repository" {
  source = "git::https://github.com/hungryengineer/mod.git//ecr_repository?ref=feature"
  create_private_repository            = var.create_private_repository
  repository_name                      = var.repository_name
  repository_image_tag_mutability       = var.repository_image_tag_mutability

#   encryption_configuration {
#     encryption_type = var.repository_encryption_type
#     # kms_key         = var.repository_kms_key
#   }
  repository_encryption_type = var.repository_encryption_type
#   repository_force_delete    = var.repository_force_delete

#   image_scanning_configuration {
#     scan_on_push = var.repository_image_scan_on_push
#   }

  repository_image_scan_on_push = var.repository_image_scan_on_push

  tags = local.tags
}

################ lifecycle policy ############

module "ecr_lifecycle_policy" {
    source = "git::https://github.com/hungryengineer/mod.git//ecr_lifecycle_policy?ref=feature"
    create_lifecycle_policy = var.create_lifecycle_policy

  repository = var.repository_name
  repository_lifecycle_policy     = var.repository_lifecycle_policy
}

########### scan ############

module "ecr_registry_scanning_configuration" {
    source = "git::https://github.com/hungryengineer/mod.git//ecr_registry_scanning_configuration?ref=feature"
    create_registry_scanning_configuration = var.create_registry_scanning_configuration

  registry_scan_type = var.registry_scan_type

  rule = var.rule   
}
