# Auto-Healing AWS Web Tier Project

Terraform implementation of an N + 1 web tier that can lose any single VM without downtime. It provisions two NGINX EC2 instances across two Availability Zones behind an Application Load Balancer. The Auto Scaling Group replaces unhealthy or terminated instances automatically.

# Why I Chose AWS

I chose AWS because Auto Scaling Groups and Application Load Balancers are a direct fit for the self-healing requirement: ASG desired capacity replaces failed instances, while ALB target health checks keep traffic on healthy nodes. This keeps the IaC small, reviewable, and easy to validate with `terraform plan`.

The draw,io file is under document folder. 

# How to Run Locally

Prerequisites:

- Terraform `>= 1.8`
- AWS credentials configured in the shell
- Permission to create VPC, EC2, ELBv2, Auto Scaling, and related security group resources

Initialize:

```bash
terraform init
```

Validate:

```bash
terraform fmt -check -recursive
terraform validate
```

Plan:

```bash
terraform plan -out=tfplan
```

Optional apply:

```bash
terraform apply tfplan
```

After apply, open the `load_balancer_dns_name` output in a browser. To test self-healing, terminate one instance from the Auto Scaling Group and watch AWS launch a replacement to return to desired capacity.

Destroy when finished:

```bash
terraform destroy

# Cost Estimate

Estimated for `ap-southeast-2`, running continuously for about 730 hours/month:

| Item | Quantity | Approx monthly cost |
| --- | ---: | ---: |
| Application Load Balancer | 1 | AUD 27-35 |
| EC2 `t4g.nano` Linux | 2 | AUD 9-12 |
| EBS gp3 root volumes | 2 x 8 GiB | AUD 2-3 |
| Data transfer | Minimal review traffic | AUD 0-2 |
| NAT Gateway | 0 | AUD 0 |

Expected always-on total outside AWS Free Tier: about **AUD 38-52/month**.

The requested **AUD 20/month** ceiling is not realistic for an always-on AWS design that includes both a managed load balancer and at least two instances. To stay under AUD 20, use this repository for `terraform plan` review only, run it for short-lived demonstrations, or apply AWS Free Tier/promotional credits where available.
