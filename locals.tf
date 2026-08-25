locals {
  name_prefix = lower("${var.project}-${var.environment}")

  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "Terraform"
      Repository  = "cloud-security-portfolio"
      Workload    = "auto-healing-web-tier"
    },
    var.extra_tags
  )
}
