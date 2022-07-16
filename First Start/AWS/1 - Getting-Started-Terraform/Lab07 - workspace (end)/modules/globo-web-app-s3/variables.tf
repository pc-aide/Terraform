# Bucket name
variable "bucket_name" {
  type        = string
  description = "Name of the s3 bucket to create"
}

# arn - amazon resource name
# elb - elastic load balancer
# ELB service account arn
variable "elb_service_account_arn" {
  type        = string
  description = "ARN of ELB service account"
}

# Common tags
variable "common_tags" {
  type        = map(string)
  description = "Map of tags to be applied to all resources"
  default     = {}
}
