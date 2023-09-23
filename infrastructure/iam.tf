# CodeBuild Service Role
resource "aws_iam_role" "codebuild_role" {
  name        = "CodeBuildServiceRole"
  description = "Role assumed by AWS CodeBuild to access necessary resources."

  tags = {
    Terraform = "true"
    Purpose   = "CodeBuild"
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "codebuild.amazonaws.com"
        }
      }
    ]
  })
}

# CodeBuild Policy for ECR and CloudWatch Logs
resource "aws_iam_role_policy" "codebuild_policy" {
  name = "CodeBuildPolicy"
  role = aws_iam_role.codebuild_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        # ECR Permissions
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload"
        ],
        Effect   = "Allow",
        Resource = aws_ecr_repository.cambridge_quiz_app.arn
      },
      {
        # CloudWatch Logs Permissions
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "arn:aws:logs:*:*:log-group:/aws/codebuild/*"
      }
    ]
  })
}


# AppRunner Service Role
resource "aws_iam_role" "apprunner_role" {
  name        = "AppRunnerServiceRole"
  description = "Role assumed by AWS App Runner to access necessary resources."

  tags = {
    Terraform = "true"
    Purpose   = "AppRunner"
  }

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "apprunner.amazonaws.com"
        }
      }
    ]
  })
}

# AppRunner Policy for ECR
resource "aws_iam_role_policy" "apprunner_policy" {
  name = "AppRunnerPolicy"
  role = aws_iam_role.apprunner_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:BatchCheckLayerAvailability"
        ],
        Effect   = "Allow",
        Resource = aws_ecr_repository.cambridge_quiz_app.arn
      }
    ]
  })
}
