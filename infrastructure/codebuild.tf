resource "aws_codebuild_project" "cambridge_quiz_app_codebuild" {
  name           = "CambridgeQuizAppCodeBuild"
  description    = "Builds the Nuxt.js Docker image"
  build_timeout  = "5"
  queued_timeout = "5"

  service_role = aws_iam_role.codebuild_role.arn

  source {
    type            = "GITHUB"
    location        = var.github_repo_url
    git_clone_depth = 1
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_SMALL"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true
    environment_variable {
      name  = "REPOSITORY_URI"
      value = aws_ecr_repository.cambridge_quiz_app.repository_url
    }
  }
}
