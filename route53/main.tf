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
    