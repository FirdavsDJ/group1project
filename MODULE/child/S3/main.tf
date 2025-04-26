resource "aws_s3_bucket" "central_bucket" {
  bucket = var.bucket_name
  tags   = var.bucket_tags
}

resource "aws_s3_bucket_website_configuration" "central_bucket_web_site" {
  bucket = aws_s3_bucket.central_bucket.bucket
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "unblock_public_access" {
  bucket = aws_s3_bucket.central_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.central_bucket.id
  policy = templatefile("${path.module}/policy.json", { bucket_name = var.bucket_name })

  depends_on = [
    aws_s3_bucket_public_access_block.unblock_public_access
  ]
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.central_bucket.id
  versioning_configuration {
    status = var.bucket_version
  }
}

