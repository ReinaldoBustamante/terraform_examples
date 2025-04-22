resource "aws_s3_bucket_policy" "s3_personal_bucket_policy" {
  count = var.isPublic ? 1 : 0

  bucket = aws_s3_bucket.s3_personal_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "Public read get object"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3_personal_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_s3_bucket_public_access_block" "block_public_access" {
  bucket                  = aws_s3_bucket.s3_personal_bucket.id
  block_public_acls       = !var.isPublic
  block_public_policy     = !var.isPublic
  ignore_public_acls      = !var.isPublic
  restrict_public_buckets = !var.isPublic
}