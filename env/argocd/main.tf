resource "aws_ecr_repository" "argocd_repo_server" {
  name                 = "argocd_repo_server"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}