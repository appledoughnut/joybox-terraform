resource "aws_s3_bucket" "helm_charts" {
  bucket = "joybox-helm-charts"
  acl = "private"
}