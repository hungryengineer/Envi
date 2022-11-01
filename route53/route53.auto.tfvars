create_route53_zone = true
name = "hyperion-zone.com"
vpc = [[""], ]

######### record ##########
# create_records = true
records = [["157.35.40.125"], ]
#name = "hyperion record"
type = [["A"],["HTTP"]]
ttl = 300
set_identifier = [["dev"], ]
weighted_routing_policy = [{
    weight = 100
    
}]

############### health check ###########
create_health_check = true
port = 80
# type = "HTTP"
resource_path = "/"
failure_threshold = "5"
request_interval = "30"