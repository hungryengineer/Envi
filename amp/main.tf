################### WORKSPACE ##############

module "amp" {
    source = "git::https://github.com/hungryengineer/mod.git//amp_workspace?ref=feature"
    create_workspace = var.create_workspace
    alias = var.alias
    #logging_configuration = var.logging_configuration
    #log_group_arn = data.terraform_remote_state.cloudwatch.outputs.cloudwatch_log_arn[0]
    #tags  = local.tags
    
}

#################### RULE GROUP NAMESPACE ############

module "amp_rule_group_namespace" {
    source = "git::https://github.com/hungryengineer/mod.git//amp_rule_group_namespace?ref=feature"
    name = var.name
    workspace_id = module.amp.aws_prometheus_workspace_id[0]
    data = local.data
}

################## ALERT MANAGER DEFINITION #########

module "amp_alert_manager_definition" {
    source = "git::https://github.com/hungryengineer/mod.git//amp_alert_manager_definition?ref=feature"
    workspace_id = module.amp.aws_prometheus_workspace_id[0]
    definition   = local.definition
}