resource "aws_apprunner_service" "cambridge_quiz_app_apprunner" {
  service_name = "CambridgeQuizAppAppRunner"

  source_configuration {
    authentication_configuration {
      access_role_arn = aws_iam_role.apprunner_role.arn
    }
    auto_deployments_enabled = true
    image_repository {
      image_configuration {
        port = "3000"
      }
      image_identifier      = "${aws_ecr_repository.cambridge_quiz_app.repository_url}:${var.image_tag}"
      image_repository_type = "ECR"
    }
  }

  instance_configuration {
    cpu    = "1 vCPU"
    memory = "2 GB"
  }
}
