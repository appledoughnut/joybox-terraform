provider "aws" {

}

resource "aws_s3_bucket" "charts_joybox_app" {
    bucket = "charts.joybox.app"
}