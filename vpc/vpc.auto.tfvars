##################### VPC ###########################

instance_tenancy     = "default"
cidr_block           = [["10.0.0.0/16"],]
# ipv4_ipam_pool_id    = ""
# ipv4_netmask_length  = ""
enable_dns_support   = true
enable_dns_hostnames = false


##################### SUBNET ###########################

name                 = "A"
subnet_cidrs         = [["10.0.1.0/24"], ["10.0.2.0/24"]]
azs                  = [["ap-northeast-1a"], ["ap-northeast-1c"]]


##################### NACL ###########################
create_network_acl = true
##################### NACL RULES ###########################

rule_number = "100"
egress = false
protocol = [["tcp"], ]
rule_action = "allow"
from_port = [["22"], ["80"], ]
to_port = [["22"], ["80"], ]

##################### ROUTE TABLE ###########################

##################### ROUTE ###########################

destination_cidr_block = "0.0.0.0/0"

##################### ROUTE TABLE ASSOCIATION ###########################


# ##################### FLOW LOG ###########################

traffic_type = "ALL"

# ##################### SECURITY GROUP ###########################
# security_group_ingress = [{
#   cidr_blocks    = ["10.0.0.0/16"]
#   description = null
#   from_port = 80
#   to_port = 80
#   protocol = "tcp"
# }]

# security_group_egress = [{
#   cidr_blocks    = ["0.0.0.0/0"]
#   description = null
#   from_port = 0
#   to_port = 0
#   protocol = "tcp"
# }]

# ##################### SECURITY GROUP RULES ###########################

rules = [[""], ]
type = [["ingress"], ]
