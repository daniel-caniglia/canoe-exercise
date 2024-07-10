variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "ecr_repository_url" {
  description = "URL of the ECR repository"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "target_group_arn" {
  description = "The ARN of the ALB target group"
  type        = string
}
