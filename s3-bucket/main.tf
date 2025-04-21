provider "aws" {
  region  = "us-east-1"
  profile = "student"
}

resource "aws_s3_bucket" "s3_personal_bucket" {
  bucket        = "s3-personal-bucket-123525d2asd25"
  force_destroy = true
  tags = {
    Name = "s3_personal_bucket"
  }
}

resource "aws_s3_bucket_versioning" "s3_personal_bucket_versioning" {
  bucket = aws_s3_bucket.s3_personal_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

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

resource "aws_s3_object" "name" {
  bucket       = aws_s3_bucket.s3_personal_bucket.id
  key          = "files/text.txt"
  source       = "text.txt"
  content_type = "text/plain"
  etag         = filemd5("text.txt")
}

variable "isPublic" {
  default = false
}

output "url_resource" {
    value = "https://${aws_s3_bucket.s3_personal_bucket.bucket}.s3.us-east-1.amazonaws.com/${aws_s3_object.name.key}"
}