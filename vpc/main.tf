##################### VPC ###########################
module "vpc" {
  source               = "git::https://github.com/hungryengineer/mod.git//vpc?ref=feature"
  count                = length(var.cidr_block) 
  cidr_block           = element(var.cidr_block, count.index)
#   ipv4_ipam_pool_id    = var.ipv4_ipam_pool_id
#   ipv4_netmask_length  = var.ipv4_netmask_length
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy
  tags                 = local.tags
}

##################### SUBNET ###########################

module "private_subnet" {
  source                      = "git::https://github.com/hungryengineer/mod.git//subnet?ref=feature"
  count                       = length(var.subnet_cidrs)
  name                        = var.name
  vpc_id                      = module.vpc[0].vpc_id
  subnet_cidrs                = element(var.subnet_cidrs, count.index)
  azs                         = element(var.azs, count.index) # new availability zone per subnet
  tags                        = local.tags #"Private Subnet-${count.index + 1}"
  depends_on                  = [module.vpc]
}


##################### NACL ###########################

module "private_nacl" {
  source     = "git::https://github.com/hungryengineer/mod.git//nacl?ref=feature"
  create_network_acl = var.create_network_acl
  vpc_id     = module.vpc[0].vpc_id
  subnet_ids = module.private_subnet[0].subnet_id
  tags       = local.tags
  depends_on = [module.private_subnet]
}

##################### NACL RULE ###########################

module "private_nacl_rule" {
  source = "git::https://github.com/hungryengineer/mod.git//nacl_rules?ref=feature"
  #count          = length(var.acl_rules)
  network_acl_id = module.private_nacl.nacl_id
  rule_number    = var.rule_number
  egress         = var.egress 
  protocol       = var.protocol[0]
  rule_action    = var.rule_action
  cidr_block     = var.cidr_block[0]
  from_port      = var.from_port[0]
  to_port        = var.to_port[0]
}

##################### ROUTE TABLE ###########################

module "private_route_table" {
  source = "git::https://github.com/hungryengineer/mod.git//route_table?ref=feature"
  count = length(var.subnet_cidrs) > 0 ? 1 : 0
  subnet_cidrs           = element(var.subnet_cidrs, count.index)
  vpc_id = module.vpc[0].vpc_id
  tags = local.tags
}

##################### ROUTE ###########################

module "route" {
  source = "git::https://github.com/hungryengineer/mod.git//route?ref=feature"
  count                  = length(var.subnet_cidrs) > 0 ? 1 : 0
  subnet_cidrs           = element(var.subnet_cidrs, count.index)
  route_table_id         = module.private_route_table[0].route_table_id
  destination_cidr_block = var.destination_cidr_block
  gateway_id             = module.internet_gateway[0].internet_gateway_id

#   timeouts {
#     create = "5m"
#   }
}

##################### ROUTE TABLE ASSOCIATION ###########################
module "private_route_table_association" {
  source = "git::https://github.com/hungryengineer/mod.git//route_table_association?ref=feature"
  count                       = length(var.subnet_cidrs)
  subnet_cidrs                = element(var.subnet_cidrs, count.index)
  subnet_id = module.private_subnet[0].subnet_id
  route_table_id = module.private_route_table[0].route_table_id
}

##################### INTERNET GATEWAY ###########################
module "internet_gateway" {
  source = "git::https://github.com/hungryengineer/mod.git//igw?ref=feature"
  count                      = length(var.subnet_cidrs) > 0 ? 1 : 0
  subnet_cidrs               = element(var.subnet_cidrs, count.index)
  vpc_id                     = module.vpc[0].vpc_id
  tags = local.tags  
}

##################### FLOW LOG ###########################
# module "flow_log" {
#     source = "git::https://github.com/hungryengineer/mod.git//flow_logs?ref=feature"
#   #log_destination      = aws_s3_bucket.example.arn
#   #log_destination_type = "s3"
#   traffic_type         = var.traffic_type
#   vpc_id               = module.vpc[0].vpc_id
# }

##################### SECURITY GROUP ###########################

module "security_group" {
    source = "git::https://github.com/hungryengineer/mod.git//security_group?ref=feature"
    name = var.name
    vpc_id = module.vpc[0].vpc_id
    # security_group_ingress = var.security_group_ingress
    # security_group_egress = var.security_group_egress
    tags = local.tags

}

##################### SECURITY GROUP RULES ###########################

module "security_group_rules" {
  source = "git::https://github.com/hungryengineer/mod.git//security_group_rules?ref=feature"
  count             = length(var.rules)
  rules             = var.rules
  type              = var.type[0]
  from_port         = var.from_port[1]
  to_port           = var.to_port[1]
  protocol          = var.protocol[0]
  cidr_blocks       = var.cidr_block[0]
  security_group_id = module.security_group.security_group_id[0]
  
}

################### NETWORK INTERFACE #####################

module "network_interface" {
  source = "git::https://github.com/hungryengineer/mod.git//network_interface?ref=feature"
  create_network_interface = var.create_network_interface
  subnet_id                = module.private_subnet[0].subnet_id[0]
  # private_ips              = var.private_ips
  security_groups          = module.security_group.security_group_id
  tags                     = local.tags
}