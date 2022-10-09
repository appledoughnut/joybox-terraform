resource "aws_s3_bucket" "helm_charts" {
  bucket = "joybox-helm-charts"
  acl = "private"
}

resource "aws_s3_bucket_object" "joybox_app" {
    bucket = "${aws_s3_bucket.helm_charts.id}"
    key    = "joybox-app/"
    content_type = "application/x-directory"
}