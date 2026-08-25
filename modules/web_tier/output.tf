output "load_balancer_dns_name" {
  description = "DNS name of the public load balancer."
  value       = aws_lb.this.dns_name
}

output "autoscaling_group_name" {
  description = "Name of the Auto Scaling Group."
  value       = aws_autoscaling_group.web.name
}

output "target_group_arn" {
  description = "ARN of the web target group."
  value       = aws_lb_target_group.web.arn
}
