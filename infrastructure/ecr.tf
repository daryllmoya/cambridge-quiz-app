# ECR Repository
resource "aws_ecr_repository" "cambridge_quiz_app" {
  name                 = "cambridge-quiz-app-repo"
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "cambridge_quiz_app" {
  repository = aws_ecr_repository.cambridge_quiz_app.name
  policy = <<EOF
{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Keep only the last 3 images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "imageCountMoreThan",
        "countNumber": 3
      },
      "action": {
        "type": "expire"
      }
    }
  ]
}
EOF
}