module "cloudwatch" {
    source = "git::https://github.com/hungryengineer/mod.git//cloudwatch_log_group?ref=feature"
    
    name = var.name

    tags = local.tags
}