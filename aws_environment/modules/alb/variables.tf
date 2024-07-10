variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "target_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "certificate_arn" {
  description = "The ARN of the ACM certificate for HTTPS"
  type        = string
}
