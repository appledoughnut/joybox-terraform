resource "aws_ecr_repository" "product-management-web" {
  name                 = "product-management-web"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}