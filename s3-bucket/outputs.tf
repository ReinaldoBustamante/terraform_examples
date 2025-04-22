output "url_resource" {
    value = "https://${aws_s3_bucket.s3_personal_bucket.bucket}.s3.us-east-1.amazonaws.com/${aws_s3_object.name.key}"
}