#Create iam lambda execution role

resource "aws_iam_role" "lambda_execution_role" {
  name               = "LambdaExecutionRole"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

#archive python file and take data
data "archive_file" "lambda" {
  type        = "zip"
  source_file = var.source_file
  output_path = "lambda_function_payload.zip"
}

locals {
  modified_sourcefile_name = "${replace(var.source_file, ".py", "")}"
}
#create lambda function
resource "aws_lambda_function" "my_lambda" {

  filename      = "lambda_function_payload.zip"
  function_name = var.lambda_function_name
  handler       = "${local.modified_sourcefile_name}.lambda_handler"
  role          = aws_iam_role.lambda_execution_role.arn
  

  source_code_hash = data.archive_file.lambda.output_base64sha256

  runtime = var.runtime

  environment {
    variables = {
      foo = "bar"
    }
  }
}

