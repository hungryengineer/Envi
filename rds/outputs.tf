output "db_instance_address" {
    value = module.db_instance[*].db_instance_address
}

output "db_instance_arn" {
    value = module.db_instance[*].db_instance_arn
}

output "db_instance_domain" {
    value = module.db_instance[*].db_instance_domain
}

output "db_instance_endpoint" {
    value = module.db_instance[*].db_instance_endpoint
}

output "db_instance_hosted_zone_id" {
    value = module.db_instance[*].db_instance_hosted_zone_id
}

output "db_instance_id" {
    value = module.db_instance[*].db_instance_id
}

output "db_instance_resource_id" {
    value = module.db_instance[*].db_instance_resource_id
}