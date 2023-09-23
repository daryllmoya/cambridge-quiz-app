resource "aws_codebuild_project" "cambridge_quiz_app_build" {
  name          = "CambridgeQuizAppBuild"
  description   = "Builds the Nuxt.js Docker image"
  service_role  = aws_iam_role.codebuild_role.arn
  build_timeout = "5"

  source {
    type            = "GITHUB"
    location        = var.github_repo_url
    git_clone_depth = 1
  }

  artifacts {
    type = "NO_ARTIFACTS"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:5.0"
    type                        = "LINUX_CONTAINER"
    environment_variable {
      name  = "REPOSITORY_URI"
      value = aws_ecr_repository.cambridge_quiz_app.repository_url
    }
  }
}
