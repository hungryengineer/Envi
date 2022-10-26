############################ NLB #########################
name = "main"
internal = false
load_balancer_type = "network"
enable_deletion_protection = true
enable_cross_zone_load_balancing = true
ip_address_type = "ipv4"
desync_mitigation_mode = "defensive"
# access_logs = [{
#     enabled = "false"
#     bucket = ""
#     prefix = ""
# }]
tags = {
    env = "dev"
}
# lb_tags = [{
#     type = "nlb"
# }]

########################### TARGET GROUP #########################
create_target_group = true
port = 80
protocol = "TCP"
target_type = "ip"
#load_balancing_algorithm_type = "round_robin"
health_check = [{
    enabled = true
    interval = 30
    #path = "/"
    port = 80
    healthy_threshold = 2
    unhealthy_threshold = 2
    #timeout = 10
    protocol = "TCP"
    #matcher = "201"
}]

stickiness = [{
    enabled = true
    type = "source_ip" 
}]

########################### LISTENER ##########################
create_lb_listener = true
type = "forward"
# default_action = [""],
# fixed_response = {
#      content_type = "application/json"
#      message_body = "Not found"
#      status_code  = "501"
# }

default_action = [[""],]
fixed_response = null