create_private_repository       = true
repository_name                 = "hyperion-apps"
repository_image_tag_mutability = "MUTABLE"
repository_encryption_type      = "AES256"
# repository_force_delete         = false
repository_image_scan_on_push   = true

############## lifecycle policy #########

create_lifecycle_policy         = true
repository_lifecycle_policy     = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Expire images older than 14 days",
            "selection": {
                "tagStatus": "untagged",
                "countType": "sinceImagePushed",
                "countUnit": "days",
                "countNumber": 14
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF

############ scan #############
create_registry_scanning_configuration = true
registry_scan_type                     = "BASIC"
rule = {scan_frequency = "SCAN_ON_PUSH", filter = "example", filter_type = "WILDCARD"}

