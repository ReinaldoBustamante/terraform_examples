resource "aws_s3_object" "name" {
  bucket       = aws_s3_bucket.s3_personal_bucket.id
  key          = "files/text.txt"
  source       = "files/text.txt"
  content_type = "text/plain"
  etag         = filemd5("files/text.txt")
}
