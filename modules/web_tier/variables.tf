variable "name_prefix" {
  description = "Prefix applied to web tier resource names."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for security groups and target group."
  type        = string
}

variable "subnet_ids" {
  description = "Public subnet IDs for the load balancer and Auto Scaling Group."
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for NGINX web servers."
  type        = string
}

variable "min_size" {
  description = "Minimum Auto Scaling Group size."
  type        = number
}

variable "desired_size" {
  description = "Desired Auto Scaling Group size."
  type        = number
}

variable "max_size" {
  description = "Maximum Auto Scaling Group size."
  type        = number
}

variable "health_path" {
  description = "HTTP path used by the load balancer health check."
  type        = string
}
