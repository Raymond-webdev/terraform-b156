# Learn Terraform: Your First Resource

This small project uses Terraform to create a text file on your computer. It needs no cloud account and creates no billable infrastructure.

## What you will learn

- How Terraform configuration files fit together
- What a provider and resource do
- How to set values with input variables
- How to preview, apply, and remove infrastructure
- How Terraform state helps track resources

## Prerequisites

- Terraform CLI 1.5 or later: <https://developer.hashicorp.com/terraform/install>
- A terminal opened in this folder

Check your installation:

```powershell
terraform version
```

## Project files

- `main.tf` declares the Terraform version, the Local provider, and the file resource.
- `variables.tf` defines the message and output filename inputs.
- `outputs.tf` displays useful values after an apply.
- `terraform.tfvars.example` shows how to customize the inputs.

Terraform loads all `.tf` files in the current directory together; the filenames are for organization.

## Step by step

### 1. Initialize the project

```powershell
terraform init
```

Terraform downloads the Local provider and prepares the working directory. Run this again if you add or change providers.

### 2. Customize the inputs (optional)

Copy the example variables file, then edit the values:

```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

For example, set `message` to `Hello from my first Terraform project!`. You can skip this step and use the defaults in `variables.tf`.

### 3. Format and validate

```powershell
terraform fmt
terraform validate
```

`fmt` applies Terraform's standard formatting. `validate` checks the configuration for errors.

### 4. Preview the change

```powershell
terraform plan
```

Review the plan before changing anything. You should see Terraform propose creating one `local_file` resource. No file is created by `plan`.

### 5. Create the file

```powershell
terraform apply
```

Terraform shows the plan again and asks for confirmation. Type `yes`. It creates `terraform-learning-output.txt` (or the filename you configured) and prints the outputs.

Open the generated file to see your message. Terraform records what it manages in `terraform.tfstate`; keep that file safe and do not edit it by hand.

### 6. Try a change

Change `message` in `terraform.tfvars`, then run:

```powershell
terraform plan
terraform apply
```

The plan shows that Terraform will update the managed file. After confirming, check the file again. Running `terraform plan` a second time should show no changes: the configuration and real resource agree.

### 7. Clean up

```powershell
terraform destroy
```

Review the proposed deletion and type `yes`. Terraform removes the generated file and its managed resource. The `.tf` configuration remains, so you can run `terraform apply` again later.

## How the pieces fit together

1. The `required_providers` block in `main.tf` tells Terraform which provider plugin to install.
2. The `local_file` resource uses that provider to manage a file on your machine.
3. The resource reads `var.output_file` and `var.message`, whose defaults are declared in `variables.tf` and can be overridden in `terraform.tfvars`.
4. The `output` blocks in `outputs.tf` print values Terraform knows after creating the resource.
5. Terraform compares your desired configuration with its state and the resource to determine what the next plan should do.

## Next steps

Once this workflow feels familiar, try a provider for a platform you use. Cloud providers may create billable resources, so set a budget, use a sandbox account, and read the provider's cleanup guidance before applying.
