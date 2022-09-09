## Serverless Application With API Gateway, AWS Lambda, and DynamoDB using Terrafor

<p align="center">
  <img src="banner.png" height="400">
  <h1 align="center">
Architecture
    <br>
    <a href="https://github.com/OkiriGabriel/Serverless-Api-with-Lambda-API-gateway-Dynamodb"><img alt="build-status" src="https://ibb.co/NLqVYZJ" /></a>
    
  </h1>
</p>

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Basic Usage

```terraform
resource "aws_lambda_function" "writeLambda" {

  function_name = "name"
  s3_bucket     = "your-bucket-name"
  s3_key        = "your-key"
  role          = aws_iam_role.writeRole.arn
  handler       = "your handler"
  runtime       = "nodejs12.x/python"
}

resource "aws_iam_role_policy" "write_policy" {
  name = "policyname"
  role = aws_iam_role.writeRole.id

  policy = file("policy")
}

resource "aws_dynamodb_table" "ddbtable" {
  name             = "db"
  hash_key         = "id"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_api_gateway_rest_api" "apiLambda" {
  name        = "myAPI"

}


resource "aws_api_gateway_resource" "writeResource" {
  rest_api_id = aws_api_gateway_rest_api.apiLambda.id
  parent_id   = aws_api_gateway_rest_api.apiLambda.root_resource_id
  path_part   = "db"

}

```


##  STEPS

1. Create your s3 bucket and upload your zipped lambda code

2. Create your dynamodb.

3. Create your Lambda function, make sure you reference your zipped lambda file from the bucket.

4. Attach your Policy to the lambda role

5. Create your API gateway
