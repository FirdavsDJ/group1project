module "s3_bucket" {
  source         = "../child/S3/"
  bucket_name    = "firdavs-unique-s3-bucket-001"
  bucket_version = "Enabled"
  bucket_tags = {
    Name = "Development"
  }
}


