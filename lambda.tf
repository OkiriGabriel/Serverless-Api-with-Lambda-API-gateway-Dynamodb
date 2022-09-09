resource "aws_lambda_function" "writeLambda" {

  function_name = "writeLambda"
  s3_bucket     = "lambda-buck13e"
  s3_key        = "writeterra.zip"
  role          = aws_iam_role.writeRole.arn
  handler       = "writeterra.handler"
  runtime       = "nodejs12.x"
}


resource "aws_lambda_function" "readLambda" {

  function_name = "readLambda"
  s3_bucket     = "lambda-buck13e"
  s3_key        = "readterra.zip"
  role          = aws_iam_role.readRole.arn
  handler       = "readterra.handler"
  runtime       = "nodejs12.x"
}