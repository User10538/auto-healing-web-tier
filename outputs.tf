output "load_balancer_dns_name" {
  description = "Public DNS name for the Application Load Balancer."
  value       = module.web_tier.load_balancer_dns_name
}

output "autoscaling_group_name" {
  description = "Name of the self-healing Auto Scaling Group."
  value       = module.web_tier.autoscaling_group_name
}

output "vpc_id" {
  description = "ID of the VPC created for the web tier."
  value       = module.network.vpc_id
}
