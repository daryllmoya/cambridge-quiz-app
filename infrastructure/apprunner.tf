resource "aws_apprunner_service" "cambridge_quiz_app_service" {
  service_name = "CambridgeQuizAppService"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_role.arn
    }
    auto_deployments_enabled = true
    image_repository {
      image_configuration {
        port = "3000"
      }
      image_identifier = aws_ecr_repository.cambridge_quiz_app.repository_url
      image_repository_type = "ECR"
    }
  }

  instance_configuration {
    cpu = "1 vCPU"
    memory = "2 GB"
  }
}

resource "aws_iam_role" "apprunner_role" {
  name = "AppRunnerServiceRole"

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
        Effect = "Allow",
        Resource = aws_ecr_repository.cambridge_quiz_app.arn
      }
    ]
  })
}
