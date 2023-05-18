output "bucket_arn" {
  description = "The ARN of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.arn
}

output "bucket_id" {
  description = "The ID of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.id
}

output "bucket_domain_name" {
  description = "The bucket domain of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.bucket_domain_name
}

output "bucket_hosted_zone_id" {
  description = "The Route 53 hosted zone ID of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.hosted_zone_id
}

output "bucket_name" {
  description = "The name of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.bucket
}

output "bucket_region" {
  description = "The AWS region of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.region
}

output "bucket_regional_domain_name" {
  description = "The bucket region-specific domain name of the bucket that stores terraform logs."
  value       = aws_s3_bucket.main.bucket_regional_domain_name
}
