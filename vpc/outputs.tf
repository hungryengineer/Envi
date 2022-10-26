##################### VPC ###########################


output "vpc_id" {
    value = module.vpc[*].vpc_id
    description = "The ID of the VPC"
}

output "arn" {
    value = module.vpc[*].arn
    description = "Amazon Resource Name (ARN) of VPC"
}

output "owner_id" {
    value = module.vpc[*].owner_id
    description = "Amazon Resource Name (ARN) of VPC"
}

##################### SUBNET ###########################

output "subnet_id" {
    value = module.private_subnet[*].subnet_id
}

output "subnet_arn" {
    value = module.private_subnet[*].subnet_arn
}

##################### NACL ###########################

output "nacl_id" {
    value = module.private_nacl[*].nacl_id
}

output "nacl_arn" {
    value = module.private_nacl[*].nacl_arn
}

##################### NACL RULES ###########################

output "nacl_rule_id" {
    value = module.private_nacl_rule[*].nacl_rule_id
}

##################### ROUTE TABLE ###########################
output "route_table_id" {
    value = module.private_route_table[*].route_table_id
}

output "route_table_arn" {
    value = module.private_route_table[*].route_table_arn
}

##################### ROUTE ###########################

output "route_id" {
    value = module.route[*].route_id
}

output "route_state" {
    value = module.route[*].route_state
}

##################### ROUTE TABLE ASSOCIATION #################

output "route_table_association_id" {
    value = module.private_route_table_association[*].route_table_association_id
}

##################### INTERNET GATEWAY ########################
output "internet_gateway_id" {
    value = module.internet_gateway[*].internet_gateway_id
}

output "internet_gateway_arn" {
    value = module.internet_gateway[*].internet_gateway_arn
}

##################### SECURITY GROUP #########################

output "security_group_id" {
    value = module.security_group[*].security_group_id
}

output "security_group_arn" {
    value = module.security_group[*].security_group_arn
}


#################### SECURITY GROUP RULES ######################

output "security_group_rules_id" {
    value = module.security_group_rules[*].security_group_rules_id
}