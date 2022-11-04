output "ecr_repository_arn" {
    value = module.ecr_repository[*].ecr_repository_arn
}

output "ecr_repository_registry_id" {
    value = module.ecr_repository[*].ecr_repository_registry_id
}

output "ecr_repository_repository_url" {
    value = module.ecr_repository[*].ecr_repository_repository_url
}

################# lifecycle policy ###########

output "lifecycle_policy_repository" {
    value = module.ecr_lifecycle_policy[*].lifecycle_policy_repository
}

output "lifecycle_policy_registry_id" {
    value = module.ecr_lifecycle_policy[*].lifecycle_policy_registry_id
}

############# scan ############

output "ecr_registry_scanning_configuration_registry_id" {
    value = module.ecr_registry_scanning_configuration[*].ecr_registry_scanning_configuration_registry_id
}