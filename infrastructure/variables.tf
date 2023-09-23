variable "github_repo_url" {
  description = "The URL of the GitHub repository"
  type        = string
  default     = "https://github.com/daryllmoya/cambridge-quiz-app.git"
}

variable "image_tag" {
  description = "The default tag for the ECR image"
  type        = string
  default     = "latest"
}
