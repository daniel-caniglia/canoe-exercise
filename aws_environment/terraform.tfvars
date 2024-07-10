aws_region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

public_subnet_cidrs = [
  "10.0.1.0/24"
]

private_subnet_cidrs = [
  "10.0.2.0/24",
  "10.0.3.0/24",
  "10.0.4.0/24"
]

certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/abc12345-67d8-90ef-1ghi-234jklmno567" # Replace with your actual ACM certificate ARN
