module "lambda-api" {
  source           = "./modules/lambda-api"
  source_file = var.source_file
  lambda_function_name = var.lambda_function_name
  runtime = var.runtime
  api_getway_name = var.api_getway_name
}