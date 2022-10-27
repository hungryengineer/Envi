output "aws_prometheus_workspace_id" {
    value = module.amp[*].aws_prometheus_workspace_id
}

output "aws_prometheus_workspace_arn" {
    value = module.amp[*].aws_prometheus_workspace_arn
}

output "aws_prometheus_workspace_prometheus_endpoint" {
    value = module.amp[*].aws_prometheus_workspace_prometheus_endpoint
}