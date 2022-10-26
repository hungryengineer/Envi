variable "name" {
  
}

variable "internal" {
  
}

variable "load_balancer_type" {
  
}

variable "enable_deletion_protection" {
  type = bool
  description = "If true, deletion of the load balancer will be disabled via the AWS API. This will prevent Terraform from deleting the load balancer."
}

variable "enable_cross_zone_load_balancing" {
  
}

variable "ip_address_type" {
  
}

variable "desync_mitigation_mode" {
  
}

# variable "access_logs" {
  
# }

########################## TARGET GROUP #####################

variable "create_target_group" {
  
}

variable "port" {
  
}

variable "protocol" {
  
}

variable "target_type" {
  
}

# variable "load_balancing_algorithm_type" {
  
# }

variable "health_check" {
  
}

variable "stickiness" {
  
}

########################### LISTENER ##########################
variable "create_lb_listener" {
  
}
variable "type" {
  
}

variable "default_action" {

}
variable "fixed_response" {
  
}