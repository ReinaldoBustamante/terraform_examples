resource "aws_s3_bucket_versioning" "s3_personal_bucket_versioning" {
  bucket = aws_s3_bucket.s3_personal_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}