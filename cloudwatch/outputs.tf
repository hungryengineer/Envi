output "cloudwatch_log_arn" {
    value = module.cloudwatch[*].cloudwatch_log_arn
}