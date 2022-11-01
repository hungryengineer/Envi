output "route53_zone_arn" {
    value = module.route53_zone[*].route53_zone_arn
}

output "route53_zone_zone_id" {
    value = module.route53_zone[*].route53_zone_zone_id
}

output "route53_zone_name_servers" {
    value = module.route53_zone[*].route53_zone_name_servers
}

############ ZONE ASSOCIATION ############

# output "route53_zone_association_id" {
#     value = module.route53_zone_association[*].route53_zone_association_id
# }

############ record ###########

output "route53_name" {
    value = module.route53_record[*].route53_name
}

output "route53_fqdn" {
    value = module.route53_record[*].route53_fqdn
}

########### health check #########
output "route53_health_check_id" {
    value = module.route53_health_check[*].route53_health_check_id
}

output "route53_health_check_arn" {
    value = module.route53_health_check[*].route53_health_check_arn
}