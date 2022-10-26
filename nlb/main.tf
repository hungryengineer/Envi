############################### NLB ################################
module "nlb" {
  source = "git::https://github.com/hungryengineer/mod.git//lb?ref=feature"
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  subnets            = data.terraform_remote_state.vpc.outputs.subnet_id[0] #[for subnet in data.terraform_remote_state.vpc.outputs.subnet_id[*] : subnet.id]
  enable_deletion_protection = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  ip_address_type                  = var.ip_address_type
  desync_mitigation_mode           = var.desync_mitigation_mode
#   dynamic access_logs {
#     for_each = length(keys(var.access_logs)) == 0 ? [] : [var.access_logs]
#     content {
#         enabled = access_logs.value.enabled
#         bucket = access_logs.value.bucket
#         prefix = access_logs.value.prefix
#     }
#   }
   tags = local.tags
}

############################### TARGET GROUP ################################

module "lb_target_group" {
  source = "git::https://github.com/hungryengineer/mod.git//lb_target_group?ref=feature"
  count = var.create_target_group ? 1 : 0
  create_target_group = var.create_target_group
  ip_address_type = var.ip_address_type
  name        = var.name
  port        = var.port
  protocol    = var.protocol
  target_type = var.target_type
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id[0]
  #load_balancing_algorithm_type = var.load_balancing_algorithm_type
  health_check = var.health_check[0]
  stickiness = var.stickiness[0]
}

########################### LISTENER ##########################
module "lb_listener" {
  source                 = "git::https://github.com/hungryengineer/mod.git//lb_listener?ref=feature"
  count                  = var.create_lb_listener ? 1 : 0
  create_lb_listener     = var.create_lb_listener
  load_balancer_arn      = module.nlb.aws_lb_arn
  port                   = var.port
  protocol               = var.protocol
  default_action         = var.default_action
  type                   = var.type
  target_group_arn       = module.lb_target_group[0].lb_target_group_arn[0]
  fixed_response         = var.fixed_response
  tags                   = local.tags
}
