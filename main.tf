locals {
  shared_name = var.bucket_name == null ? "${var.environment}-${var.aws_account}" : var.bucket_name
}

resource "aws_s3_bucket" "main" {
  bucket        = local.shared_name
  force_destroy = var.force_destroy
}

resource "aws_s3_bucket_acl" "main" {
  bucket = aws_s3_bucket.main.bucket
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.main.bucket
  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Disabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket
  rule {
    id     = "${local.shared_name}-rule"
    status = "Enabled"

    filter {
      and {
        prefix = var.access_log_prefix
        tags = {
          rule      = "${local.shared_name}-rule"
          autoclean = "true"
        }
      }
    }

    transition {
      days          = var.days_to_standard_ia
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = var.days_to_glacier
      storage_class = "GLACIER"
    }

    expiration {
      days = var.days_to_expire
    }
  }
}

resource "aws_s3_bucket_public_access_block" "main" {
  bucket                  = aws_s3_bucket.main.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "main" {
  bucket = aws_s3_bucket.main.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
    bucket_key_enabled = true
  }
}
