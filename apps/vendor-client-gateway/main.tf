resource "aws_ecr_repository" "vendor-client-gateway" {
  name                 = "vendor-client-gateway"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}