resource "aws_lambda_function" "main" {
  function_name = "${var.project_name}-lambda"

  filename         = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")

  role = aws_iam_role.lambda_role.arn

  runtime = "nodejs20.x"
  handler = "index.handler"

  timeout     = 10
  memory_size = 128

  environment {
    variables = {
      TABLE_NAME  = aws_dynamodb_table.main.name
      BUCKET_NAME = aws_s3_bucket.main.bucket
    }
  }

  tags = {
    Name = "${var.project_name}-lambda"
  }
}
