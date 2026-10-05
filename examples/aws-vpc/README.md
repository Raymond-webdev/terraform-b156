# AWS VPC Example

This standalone Terraform configuration creates:

- One VPC with a `/16` CIDR block
- Two public subnets and two private subnets across two availability zones
- One internet gateway
- One NAT gateway with an Elastic IP, placed in the first public subnet
- Two route tables: one shared by both public subnets and one shared by both private subnets

The public route table sends internet-bound traffic to the internet gateway. The private route table sends internet-bound traffic through the NAT gateway. Both private subnets use the same NAT gateway, so this is a cost-conscious example rather than a highly available production design.

## Prerequisites

- Terraform 1.5 or later
- AWS credentials configured through the AWS CLI, environment variables, or another standard AWS credential source
- An AWS account with permission to create VPC, subnet, route table, gateway, and Elastic IP resources

## Use

Run these commands from this directory:

```powershell
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
```

Set a different region with `terraform apply -var="aws_region=us-west-2"` if needed. Confirm the plan before applying.

NAT gateways and Elastic IPs can incur AWS charges. When finished, remove the example resources with:

```powershell
terraform destroy
```

The VPC resource follows the [HashiCorp AWS provider `aws_vpc` documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc).