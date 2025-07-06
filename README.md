# ☁️ Multi-Cloud Kubernetes Infrastructure with Terraform

This project implements a **multi-cloud, multi-cluster Kubernetes infrastructure** across **Google Cloud Platform (GCP)**, **Amazon Web Services (AWS)**, and **Cloudflare** using **Terraform** and optionally **Terragrunt**.

---

## 🌍 Overview

This infrastructure enables:

- ✅ **Avoidance of vendor lock-in**
- 🔁 **High availability and geographic redundancy**
- 🔒 **Data security through cross-cloud replication**
- ⚖️ **Geo-aware traffic routing using Cloudflare DNS and Load Balancing**

---

## 🗺️ Architecture Diagram

                    +----------------------+
                    |     Cloudflare DNS   |
                    |   (Geo load-balancer)|
                    +----------+-----------+
                               |
                    +----------+-----------+
                    |                      |
      +-------------v-----+       +--------v-------------+
      |     GCP VPC        |       |     AWS VPC          |
      |  GKE Kubernetes    |       |  EKS Kubernetes       |
      |  Public IP         |       |  Public IP            |
      |  PostgreSQL DB     |<----->|  PostgreSQL DB        |
      +--------------------+       +-----------------------+

                <==== Data replication between DBs ====>



---

## 🧱 Components

### ☁️ Cloud Providers

- **GCP**:
  - VPC
  - GKE Cluster (Kubernetes)
  - PostgreSQL Database

- **AWS**:
  - VPC
  - EKS Cluster (Kubernetes)
  - PostgreSQL Database

- **Cloudflare**:
  - DNS resolution
  - Load balancing across public IPs of GCP and AWS clusters

### 🛡️ Database

PostgreSQL databases are deployed in both GCP and AWS and configured for **bidirectional replication** to ensure:

- Redundancy
- Failover protection
- Consistency across regions

---

## 📁 Project Structure

.
├── modules/ # Reusable cloud modules (network, kubernetes, db, etc.)
│ ├── aws/
│ ├── gcp/
│ └── shared/
├── envs/ # Environment-specific configurations
│ ├── dev/
│ │ ├── aws/
│ │ └── gcp/
│ ├── prod/
│ │ ├── aws/
│ │ └── gcp/
│ └── test/
│ ├── aws/
│ └── gcp/
└── terragrunt/ # Optional: Terragrunt entrypoints for orchestrating environments
├── aws.hcl
├── gcp.hcl
└── prod.hcl



---

## 📦 How to Use

### 🔹 Run a Specific Cloud & Environment

You can apply infrastructure only for a specific cloud provider (e.g., GCP or AWS):

```bash
cd envs/prod/gcp
terraform init
terraform validate
terraform apply
```
Repeat for envs/prod/aws, envs/dev/gcp, etc.
To apply everything across providers and environments:

```bash
cd terragrunt/
terragrunt run-all apply --terragrunt-config prod.hcl
```
Or run per provider:
```bash
terragrunt run-all apply --terragrunt-config aws.hcl
terragrunt run-all apply --terragrunt-config gcp.hcl
```

🤝 Contributions

Contributions are welcome! Fork the repo and open a PR.