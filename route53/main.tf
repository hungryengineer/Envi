################## zone ################

module "route53_zone" {
  source = "git::https://github.com/hungryengineer/mod.git//route53_zone?ref=feature"
    
  create_route53_zone = var.create_route53_zone
  name = var.name
  vpc = var.vpc
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id[0]
}

################ zone association #############
# module "route53_zone_association" {
#   source = "git::https://github.com/hungryengineer/mod.git//route53_zone_association?ref=feature"
    
#   zone_id = module.route53_zone.route53_zone_zone_id[0]
#   vpc_id  = data.terraform_remote_state.vpc.outputs.vpc_id[*] ##another vpc_id to be given here to be associated to
# }

############## record ################

module "route53_record" {
  source = "git::https://github.com/hungryengineer/mod.git//route53_record?ref=feature"
  zone_id = module.route53_zone.route53_zone_zone_id[0]
  name    = var.name
  type    = var.type[0]
  ttl     = var.ttl
  records = var.records
  set_identifier = var.set_identifier[0]
  weighted_routing_policy = var.weighted_routing_policy[0]

}

############ health check #############
module "route53_health_check" {
source = "git::https://github.com/hungryengineer/mod.git//route53_health_check?ref=feature"
  create_health_check = var.create_health_check
  fqdn              = module.route53_record.route53_fqdn[0]
  port              = var.port
  type              = var.type[1]
  resource_path     = var.resource_path
  failure_threshold = var.failure_threshold
  request_interval  = var.request_interval
  tags              = local.tags
}

