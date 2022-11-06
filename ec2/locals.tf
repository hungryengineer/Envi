locals{
##################### VPC ###########################

  tags = {
    type = "main"
    env = "dev"
    Name = "hyperion-bastion"

 }
 volume_tags = {
    host_type = "bastion"
 }
}
