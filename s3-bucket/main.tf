resource "aws_s3_bucket" "s3_personal_bucket" {
  bucket        = "s3-personal-bucket-123525d2asd25"
  force_destroy = true

  tags = {
    Name = "s3_personal_bucket"
  }
}
