output "ec2_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.product_api.id
}

output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.product_api.public_ip
}

output "s3_bucket_name" {
  description = "S3 bucket name for product assets"
  value       = aws_s3_bucket.product_assets.id
}

output "cloudfront_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.product_assets_cdn.domain_name
}

output "dynamodb_table_names" {
  description = "Names of DynamoDB tables for product storage"
  value       = [for table in aws_dynamodb_table.product_storage : table.name]
}
