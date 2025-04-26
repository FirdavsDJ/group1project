data "aws_caller_identity" "current" {}

module "s3_bucket_for_utility" {
  source      = "./module/s3"
  bucket_name = "testing-bucket-artifact-${data.aws_caller_identity.current.account_id}-${var.env_type}"
  s3_tags = {
    Name        = "Utility-Bucket"
    Environment = var.env_type
  }
}

module "s3_bucket_for_utility-1" {
  source      = "./module/s3"
  bucket_name = "testing-bucket-artifact-1-${data.aws_caller_identity.current.account_id}-${var.env_type}"
  s3_tags = {
    Name        = "Utility-Bucket-1"
    Environment = var.env_type
  }
}

module "s3_bucket_for_utility-2" {
  source      = "./module/s3"
  bucket_name = "testing-bucket-artifact-2-${data.aws_caller_identity.current.account_id}-${var.env_type}"
  s3_tags = {
    Name        = "Utility-Bucket-2"
    Environment = var.env_type
  }
}

