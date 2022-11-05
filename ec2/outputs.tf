output "ec2_instance_arn" {
    value = module.ec2_instance_bastion_host[*].ec2_instance_arn
}

output "ec2_instance_instance_state" {
    value = module.ec2_instance_bastion_host[*].ec2_instance_instance_state
}

output "ec2_instance_primary_network_interface_id" {
    value = module.ec2_instance_bastion_host[*].ec2_instance_primary_network_interface_id
}

output "ec2_instance_private_dns" {
    value = module.ec2_instance_bastion_host[*].ec2_instance_private_dns
}