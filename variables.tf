variable "access_log_prefix" {
  description = "Prefix used for Access logs in the access log bucket."
  type        = string
}

variable "aws_account" {
  description = "AWS account ID."
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "bucket_name" {
  default     = null
  description = "specific bucket name, auto-generated if left blank."
  type        = string
}

variable "environment" {
  description = "Designated environment label, for example: prod, beta, test, non-prod, etc."
  type        = string
}

variable "force_destroy" {
  description = "force bucket destruction"
  type        = bool
  default     = false
}

variable "enable_versioning" {
  default     = false
  type        = bool
  description = "Toggle bucket versioning on (ture) or off (false)."
}
