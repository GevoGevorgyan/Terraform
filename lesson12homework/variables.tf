variable "source_file" {
    type = string
    default = "helloworld.py"
}

variable "lambda_function_name" {
  type = string
  default = "gg_lambda"
}

variable "runtime" {
  type = string
  default = "python3.9"
}

variable "api_getway_name" {
  type = string
  default = "MyApi"
}