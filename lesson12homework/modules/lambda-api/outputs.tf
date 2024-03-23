output "LambdaExecutionRole_arn" {
  value = aws_iam_role.lambda_execution_role.arn
}
output "modified_sourcefile_name" {
  value = local.modified_sourcefile_name
}

output "api_endpoint" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}