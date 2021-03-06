resource "aws_iam_role" "iam-for-lambda" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "iam-policy-for-lambda" {
  name = "lambda-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid : "SpecificTable",
        Effect : "Allow",
        Action : [
          "dynamodb:*"
        ],
        Resource : var.dynamodb_arn
      }
    ]
  })

  role = aws_iam_role.iam-for-lambda.id
}

resource "aws_lambda_function" "wild-rydes-lambda" {
  filename         = "requestUnicorn.zip"
  function_name    = "RequestUnicorn"
  handler          = "requestUnicorn.handler"
  role             = aws_iam_role.iam-for-lambda.arn
  runtime          = "nodejs12.x"
  source_code_hash = filebase64sha256("requestUnicorn.zip")
}