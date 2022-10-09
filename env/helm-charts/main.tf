resource "aws_s3_bucket" "helm_charts" {
  bucket = "helm-charts"
}

resource "aws_s3_bucket_object" "joybox_app" {
    bucket = "${aws_s3_bucket.helm_charts.id}"
    acl    = "private"
    key    = "joybox-app/"
    content_type = "application/x-directory"
}