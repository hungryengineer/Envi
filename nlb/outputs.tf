output "aws_lb_id" {
    value = module.nlb[*].aws_lb_id
}

output "aws_lb_arn" {
    value = module.nlb[*].aws_lb_arn 
}

output "aws_lb_arn_suffix" {
    value = module.nlb[*].aws_lb_arn_suffix
}

output "aws_lb_dns_name" {
    value = module.nlb[*].aws_lb_dns_name
}

output "aws_lb_zone_id" {
    value = module.nlb[*].aws_lb_zone_id
}

########################## TARGET GROUP #####################
output "lb_target_group_name" {
    value = module.lb_target_group[*].lb_target_group_name
}

output "lb_target_group_arn" {
    value = module.lb_target_group[*].lb_target_group_arn
}

output "lb_target_group_id" {
    value = module.lb_target_group[*].lb_target_group_id
}

output "lb_target_group_arn_suffix" {
    value = module.lb_target_group[*].lb_target_group_arn_suffix
}

########################### LISTENER ##########################
output "lb_listener_id" {
    value = module.lb_listener[*].lb_listener_id
}

output "lb_listener_arn" {
    value = module.lb_listener[*].lb_listener_arn
}