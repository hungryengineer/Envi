module "ec2_instance_bastion_host" {
    source = "git::https://github.com/hungryengineer/mod.git//ec2_instance?ref=feature"
  # instance_name = local.instance_name
  create_instance = var.create_instance

  ami                  = var.ami
  instance_type        = var.instance_type
  hibernation          = var.hibernation

  availability_zone      = var.availability_zone[0]
  subnet_id              = data.terraform_remote_state.vpc.outputs.subnet_id[0]
  vpc_security_group_ids = data.terraform_remote_state.vpc.outputs.security_group_id[0]
  key_name               = var.key_name
  monitoring             = var.monitoring

  associate_public_ip_address = var.associate_public_ip_address
#   private_ip                  = var.private_ip

  ebs_optimized = var.ebs_optimized

 network_interface = var.network_interface 
 network_interface_id = data.terraform_remote_state.vpc.outputs.network_interface_id[0]
 device_index = var.device_index[0]
 delete_on_termination = var.delete_on_termination

  source_dest_check                    = length(var.network_interface) > 0 ? null : var.source_dest_check
  disable_api_termination              = var.disable_api_termination
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  tenancy                              = var.tenancy
  tags        = local.tags
  volume_tags = local.volume_tags
}