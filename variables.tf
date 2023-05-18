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

variable "days_to_standard_ia" {
  default = 45
  description = "Days before transitioning files to standard IA."
}

variable "days_to_glacier" {
  default = 90
  description = "Days before transitioning files to glacier."
}

variable "days_to_expire" {
  default = 183
  description = "Days before deleting files."
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
