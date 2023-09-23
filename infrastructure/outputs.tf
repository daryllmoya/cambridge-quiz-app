output "ecr_repository_url" {
  description = "URL of the ECR Repository"
  value       = aws_ecr_repository.cambridge_quiz_app.repository_url
}

output "apprunner_service_url" {
  description = "App Runner Service URL"
  value       = aws_apprunner_service.cambridge_quiz_app_apprunner.service_url
}
