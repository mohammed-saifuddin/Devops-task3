Devops intern task-3
🚀 Objective

Provision an EC2 Ubuntu instance using Infrastructure as Code (IaC) with Terraform.

---

 🔠 Tools Used

- Terraform
- AWS CLI
- AWS EC2
- Docker

---

 📁 Files

- `main.tf` — Terraform configuration file
- `terraform-key.pub` — SSH Public Key (used by AWS)
- `README.md` — Project guide

---

 ✅ Prerequisites

1. **Terraform installed**  
   [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

2. **AWS CLI configured**  
   Run:  
   ```bash
   aws configure
   ```

3. **SSH key pair generated**  
   If not yet created:
   ```bash
   ssh-keygen -t rsa -b 2048 -f terraform-key
   ```

4. Place `terraform-key.pub` in the same directory as `main.tf`



📦 Setup Instructions (Detailed)

 🔧 Step-by-Step Setup

 1. ✅ Create a project directory and navigate into it
```bash
mkdir terraform-aws-ec2
cd terraform-aws-ec2
```

2. 🔑 Generate SSH key pair (if not already created)
```bash
ssh-keygen -t rsa -b 2048 -f terraform-key
```
This generates:
- `terraform-key` (private key)
- `terraform-key.pub` (public key)

> ⚠️ Only the `.pub` file is used by Terraform. Keep the private key safe!

 3. 📄 Create the `main.tf` file
Paste the Terraform configuration into `main.tf`.
 4. 🔐 Configure AWS CLI with your credentials
bash
aws configure

You'll be prompted for:
- AWS Access Key ID
- AWS Secret Access Key
- Default region name (e.g., `us-east-1`)
- Default output format (you can enter `json` or just leave blank)

 5. 🧪 Initialize Terraform
bash
terraform init

This installs the required providers.
 6. 🧹 Validate the Terraform configuration
bash
terraform validate

 7. 🧾 Check the execution plan
bash
terraform plan


 8. 🚀 Apply the configuration to provision EC2
bash
terraform apply

Type `yes` when prompted.

 9. 🌐 Access the EC2 instance
Once the apply is successful, Terraform will output the **public IP address** of the EC2 instance. Use it in your browser:
bash
http://<PUBLIC_IP>

You should see the **Nginx welcome page** served from the Docker container.


 🧼 Clean Up

To destroy the infrastructure created:
bash
terraform destroy




