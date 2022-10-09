resource "aws_ecr_repository" "helm_charts" {
  name                 = "helm-charts"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}