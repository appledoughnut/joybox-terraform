provider "aws" {
  
}

resource "aws_ecr_repository" "product" {
  name                 = "product"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_db_instance" "joybox_product" {
  identifier = "joybox-product"

  allocated_storage = 20
  engine = "postgres"
  engine_version = "14.1"
  instance_class = "db.t3.micro"

  db_name = "joybox"
  username = "postgres"
  password = random_password.db_password.result
  publicly_accessible = true
  skip_final_snapshot = true 

  tags = {
      "name" = "joybox-product"
    }
}

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}