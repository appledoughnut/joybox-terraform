
module "kms" {
  source = "terraform-aws-modules/kms/aws"
  key_usage   = "ENCRYPT_DECRYPT"

  # Policy
  key_administrators = ["arn:aws:iam::282398598576:user/admin"]
  key_users          = ["arn:aws:iam::282398598576:user/admin"]
  key_service_users  = ["arn:aws:iam::282398598576:user/admin"]


  # Aliases
  aliases = ["joybox-kms"]

  tags = {
    dummy = "test"
    Terraform   = "true"
  }
}