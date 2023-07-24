resource "aws_s3_bucket" "web-app" {
  bucket = "${var.mentoring_program_prefix}-web-app-${var.my_name}"

  tags = {
    tag-key = var.mentoring_program_prefix
  }
}

resource "aws_s3_bucket_website_configuration" "web-hosting" {
  bucket = aws_s3_bucket.web-app.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}