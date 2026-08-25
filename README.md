# Auto-Healing AWS Web Tier

Terraform implementation of an N + 1 web tier that can lose any single VM without downtime. It provisions two NGINX EC2 instances across two Availability Zones behind an Application Load Balancer. The Auto Scaling Group replaces unhealthy or terminated instances automatically.

## Why AWS

I chose AWS because Auto Scaling Groups and Application Load Balancers are a direct fit for the self-healing requirement: ASG desired capacity replaces failed instances, while ALB target health checks keep traffic on healthy nodes. This keeps the IaC small, reviewable, and easy to validate with `terraform plan`.
