resource "aws_lambda_function" "practice_lambda" {
  function_name    = var.aws_lambda_function_name
  handler          = "main.handler"
  runtime          = "python3.10" // TODO:よくわからんし後で変数に変更する
  filename         = data.archive_file.practice_zip.output_path
  source_code_hash = data.archive_file.practice_zip.output_base64sha256
  role = aws_iam_role.practice_lambda_role.arn
}

data "archive_file" "practice_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_function" // TODO:ECRにpushしたイメージを使用する
  output_path = "${path.module}/practice_lambda.zip"
}

resource "aws_iam_role" "practice_lambda_role" {
  name = "practice_lambda_role"
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
      },
    ]
  })

  tags = {
    tag-key = "practice_lambda_role"
  }
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "example-lambda-policy"
  description = "IAM policy for the example Lambda function"

  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = [
          aws_cloudwatch_log_group.practice_log_group.arn,
          "${aws_cloudwatch_log_group.practice_log_group.arn}:*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.practice_lambda_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_cloudwatch_log_group" "practice_log_group" {
  name = "/aws/lambda/${aws_lambda_function.practice_lambda.function_name}"
  retention_in_days = 30
}