resource "aws_s3_bucket" "mys3bucket" {
  bucket = var.bucket_name
  acl    = "private"

}

resource "aws_s3_bucket_versioning" "mys3bucket_versioning" {
  bucket = aws_s3_bucket.mys3bucket.id

  versioning_configuration {
    status = var.bucket_versioning ? "Enabled" : "Disabled"
  }
}