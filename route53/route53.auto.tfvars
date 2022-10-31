create_route53_zone = true
name = "hyperion-zone.com"
vpc = [[""], ]

######### record ##########
# create_records = true
records = [["157.35.40.125"], ]
#name = "hyperion record"
type = "A"
ttl = 300
set_identifier = [["dev"], ]
weighted_routing_policy = [{
    weight = 100
    
}]