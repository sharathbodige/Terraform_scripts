resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.bucket_name
}

# Optional but recommended: disable ACLs & use bucket owner enforced
resource "aws_s3_bucket_ownership_controls" "mys3bucket_ownership" {
  bucket = aws_s3_bucket.mys3bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Optional but recommended: block all public access
resource "aws_s3_bucket_public_access_block" "mys3bucket_block" {
  bucket = aws_s3_bucket.mys3bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "mys3bucket_versioning" {
  bucket = aws_s3_bucket.mys3bucket.id

  versioning_configuration {
    status = var.bucket_versioning ? "Enabled" : "Disabled"
  }
}
