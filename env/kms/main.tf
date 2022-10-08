provider "aws" {

}

module "kms" {
  source = "terraform-aws-modules/kms/aws"
  key_usage   = "ENCRYPT_DECRYPT"

  # Policy
  key_administrators = ["arn:aws:iam::012345678901:role/admin"]

  # Aliases
  aliases = ["joybox"]

  tags = {
    Terraform   = "true"
  }
}