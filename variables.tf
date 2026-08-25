variable "aws_region" {
  description = "AWS region to deploy into."
  type        = string
  default     = "ap-southeast-2"
}

variable "project" {
  description = "Short project name used in resource names and tags."
  type        = string
  default     = "autoheal"
}

variable "environment" {
  description = "Environment name used in resource names and tags."
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.42.0.0/16"
}

variable "availability_zones" {
  description = "Two availability zones for N+1 public web capacity."
  type        = list(string)
  default     = ["ap-southeast-2a", "ap-southeast-2b"]

  validation {
    condition     = length(var.availability_zones) >= 2
    error_message = "At least two availability zones are required."
  }
}

variable "public_subnets" {
  description = "Public subnet CIDRs, one per availability zone."
  type        = list(string)
  default     = ["10.42.10.0/24", "10.42.20.0/24"]

  validation {
    condition     = length(var.public_subnets) >= 2
    error_message = "At least two public subnets are required."
  }
}

variable "instance_type" {
  description = "EC2 instance type for the web tier. The default is low-cost ARM."
  type        = string
  default     = "t4g.nano"
}


variable "min_size" {
  description = "Minimum Auto Scaling Group capacity."
  type        = number
  default     = 2

  validation {
    condition     = var.min_size >= 2
    error_message = "min_size must be at least 2 to preserve N+1 capacity."
  }
}

variable "desired_size" {
  description = "Desired Auto Scaling Group capacity."
  type        = number
  default     = 2

  validation {
    condition     = var.desired_size >= 2
    error_message = "desired_size must be at least 2 to place traffic on multiple instances."
  }
}

variable "max_size" {
  description = "Maximum Auto Scaling Group capacity."
  type        = number
  default     = 3

  validation {
    condition     = var.max_size >= 2
    error_message = "max_size must be at least 2."
  }
}
