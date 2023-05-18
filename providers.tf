terraform {
  required_version = ">=1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.3.09"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
