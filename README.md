



\# Multi-Environment AWS Infrastructure using Terraform



\## 📌 Overview

This project provisions \*\*multi-environment AWS infrastructure\*\* (Development, Staging, and Production) using \*\*Terraform modules\*\* for reusability and maintainability.  

Each environment creates:

\- \*\*EC2 Instances\*\* with specified instance types and counts

\- \*\*S3 Bucket\*\* for environment-specific storage

\- \*\*DynamoDB Table\*\* for application data storage

\- \*\*Security Groups\*\* for controlled access

\- \*\*Key Pair\*\* for secure SSH access



By using Terraform modules, we avoid code duplication and can easily manage resources across environments.



---



\## 🏗 Project Structure

```



.

├── main.tf                # Root module calling child modules for each environment

├── outputs.tf             # Outputs for all environments

├── providers.tf           # AWS provider configuration

├── terraform.tf           # Required provider \& version setup

├── modules/

│   └── aws\\\_infra/         # Reusable Terraform module

│       ├── my\\\_buckets.tf  # S3 bucket creation

│       ├── my\\\_instance.tf # EC2 instance + KeyPair + SG

│       ├── my\\\_table.tf    # DynamoDB table

│       ├── my\\\_variables.tf# Module variables

│       ├── outputs.tf     # Module outputs (EC2 IPs)



```



---



\## 📊 Architecture Diagram



graph TD

&nbsp;   A\[main.tf] --> B1\[dev-app module call]

&nbsp;   A --> B2\[staging-app module call]

&nbsp;   A --> B3\[prod-app module call]



&nbsp;   B1 --> M\[modules/aws\_infra]

&nbsp;   B2 --> M

&nbsp;   B3 --> M



&nbsp;   M --> C1\[S3 Bucket]

&nbsp;   M --> C2\[EC2 Instance(s) + Security Group + Key Pair]

&nbsp;   M --> C3\[DynamoDB Table]



&nbsp;   subgraph Dev Environment

&nbsp;       C1a\[S3 Bucket - dev]

&nbsp;       C2a\[1 x t2.micro EC2]

&nbsp;       C3a\[DynamoDB Table - dev]

&nbsp;   end



&nbsp;   subgraph Staging Environment

&nbsp;       C1b\[S3 Bucket - staging]

&nbsp;       C2b\[2 x t2.medium EC2]

&nbsp;       C3b\[DynamoDB Table - staging]

&nbsp;   end



&nbsp;   subgraph Production Environment

&nbsp;       C1c\[S3 Bucket - prod]

&nbsp;       C2c\[3 x t2.large EC2]

&nbsp;       C3c\[DynamoDB Table - prod]

&nbsp;   end

---



\## 🚀 Features

\- \*\*Multi-environment setup\*\*: `dev`, `staging`, `prod`

\- \*\*Reusable module\*\*: Same infrastructure logic with different variables

\- \*\*Environment-specific configuration\*\* (instance size, count, tags, etc.)

\- \*\*AWS resources created\*\*:

&nbsp; - EC2 Instances

&nbsp; - S3 Bucket

&nbsp; - DynamoDB Table

&nbsp; - Security Group

&nbsp; - SSH Key Pair

&nbsp; - Default VPC



---



\## ⚙️ Prerequisites

Before running this project, ensure you have:

\- \[Terraform](https://developer.hashicorp.com/terraform/downloads) `>= 1.0.0`

\- AWS Account with programmatic access

\- AWS CLI installed \& configured (`aws configure`)

\- SSH public key available at:

```



C:/Users/ADMIN/OneDrive/Desktop/terraform/multi-env/terra-key.pub



````



---



\## 📂 Module Inputs



| Variable         | Type   | Description                                  | Example              |

|------------------|--------|----------------------------------------------|----------------------|

| `my-env`         | string | Environment name                             | `dev`                |

| `ami\_id`         | string | AMI ID for EC2 instance                      | `ami-0144277607031eca2` |

| `instance\_type`  | string | EC2 instance type                            | `t2.micro`           |

| `instance\_count` | number | Number of EC2 instances                      | `1`                  |



---



\## 📦 Outputs



| Output Name | Description |

|-------------|-------------|

| `ec2\_instances\_public\_ips` | Public IP addresses of created EC2 instances |



---



\## 🛠 Usage



\### 1️⃣ Clone the Repository

```bash

git clone https://github.com/<your-username>/<your-repo>.git

cd <your-repo>

````



\### 2️⃣ Initialize Terraform



```bash

terraform init

```



\### 3️⃣ Plan the Deployment



```bash

terraform plan

```



\### 4️⃣ Apply the Changes



```bash

terraform apply

```



Confirm with `yes` when prompted.



\### 5️⃣ View Outputs



```bash

terraform output

```



---



\## 📊 Example Deployment



When you run `terraform apply`, resources will be created for all three environments:



\* \*\*Dev\*\*:



&nbsp; \* 1 × `t2.micro` instance

&nbsp; \* 1 S3 bucket

&nbsp; \* 1 DynamoDB table



\* \*\*Staging\*\*:



&nbsp; \* 2 × `t2.medium` instances

&nbsp; \* 1 S3 bucket

&nbsp; \* 1 DynamoDB table



\* \*\*Production\*\*:



&nbsp; \* 3 × `t2.large` instances

&nbsp; \* 1 S3 bucket

&nbsp; \* 1 DynamoDB table



---



\## 🔐 Security Notes



\* The security group opens port \*\*22\*\* to the world (`0.0.0.0/0`) for SSH access.

&nbsp; 🔴 \*Change this to your own IP in production for better security.\*

\* Do not commit your private key to GitHub.

\* Ensure the S3 bucket names are globally unique.



---



\## 🗑 Cleanup



To destroy all resources:



```bash

terraform destroy

```



Confirm with `yes` when prompted.



---



\## 📄 License



This project is open-source and available under the \[MIT License](LICENSE).



---



\## 👩‍💻 Author



\*\*Vaibhavi Sugandhi\*\*

DevOps Engineer in making 🚀



```







