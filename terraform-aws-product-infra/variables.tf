variable "aws_region" {
  description = "AWS region where resources will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name prefix used in resource tags"
  type        = string
  default     = "product-storage"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2"
  type        = string
  default     = "0.0.0.0/0"
}

variable "s3_bucket_name" {
  description = "Globally unique S3 bucket name used as product asset origin"
  type        = string
}

variable "s3_force_destroy" {
  description = "If true, allows deleting non-empty S3 bucket"
  type        = bool
  default     = false
}

variable "dynamodb_table_prefix" {
  description = "Prefix for product DynamoDB table names"
  type        = string
  default     = "product-storage"
}
