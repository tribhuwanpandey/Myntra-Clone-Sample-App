
# Myntra Clone – Kubernetes Deployment with GitOps 

This project demonstrates a **complete production-ready deployment pipeline** for a **React-based e-commerce application (Myntra Clone)** on **Amazon EKS** using modern DevOps and GitOps practices.

## UI Preview

![alt text](<Screenshot 2026-01-19 185706.png>)

### Product Categories

#### Men

![alt text](<Screenshot 2026-01-19 185725.png>)

#### Women

![alt text](<Screenshot 2026-01-19 185737.png>)

#### Kids

![alt text](<Screenshot 2026-01-19 185747.png>)

#### Home and Living

![alt text](<Screenshot 2026-01-19 185757.png>)

---

##  Tech Stack

- **Infrastructure as Code**: Terraform  
- **Container Orchestration**: Kubernetes (Amazon EKS)  
- **GitOps**: ArgoCD  
- **CI/CD**: GitHub Actions  
- **Container Registry**: Amazon ECR  
- **Load Balancing**: AWS Application Load Balancer (ALB)

---

##  Architecture Overview

```
Developer
   |
   v
GitHub (main branch)
   |
   v
GitHub Actions
 ├─ Build Docker Image
 ├─ Push Image to Amazon ECR
 └─ Update GitOps Branch (K8s manifests)
   |
   v
ArgoCD (GitOps Operator)
   |
   v
Amazon EKS Cluster
 ├─ Pod 1 (Myntra App)
 ├─ Pod 2 (Myntra App)
 └─ Pod 3 (Myntra App)
   |
   v
AWS ALB
   |
   v
Users
```

---

##  Component Details

| Component | Purpose | Technology |
|---------|--------|-----------|
| VPC | Network isolation | AWS VPC |
| EKS | Kubernetes cluster | Amazon EKS 1.28 |
| ECR | Container registry | Amazon ECR |
| ArgoCD | GitOps operator | ArgoCD on EKS |
| CI/CD | Automation | GitHub Actions |
| IaC | Infrastructure | Terraform ≥ 1.0 |
| Load Balancer | Traffic routing | AWS ALB |

---

##  Features

### Infrastructure
- Automated VPC with public & private subnets  
- Managed EKS node groups  
- Auto-scaling (2–5 nodes)  
- ECR with lifecycle policies  
- IAM roles & security groups  

### Deployment
- GitOps-based continuous deployment  
- Automated Docker image builds  
- Zero-downtime rolling updates  
- Liveness & readiness probes  
- Horizontal Pod Autoscaler (HPA)  

### Monitoring & Operations
- ArgoCD dashboard visibility  
- Kubernetes-native logging  
- Resource limits & requests  
- Production-grade configurations  

---

##  Prerequisites

### Required Tools

| Tool | Version |
|----|--------|
| AWS CLI | 2.x |
| Terraform | ≥ 1.0 |
| kubectl | Latest |
| Docker | Latest |
| Git | Latest |
| make | Latest |

### AWS Requirements
- AWS account with admin access  
- AWS CLI configured  
- Region: `ap-south-1` (Mumbai)  

### GitHub Requirements
- GitHub account  
- Access to `tribhuwanpandey/Myntra-Clone-Sample-App`  
- Ability to create GitHub Secrets  

---

##  Verify Prerequisites

```bash
aws --version
terraform version
kubectl version --client
aws sts get-caller-identity
docker --version
make --version
```

---

##  Project Structure

### Main Branch (Application Code)

```
Myntra-Clone-Sample-App/
├── .github/workflows/deploy.yml
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform.tfvars
├── k8s/app/deployment-service.yml
├── src/
├── public/
├── Dockerfile
├── Makefile
├── package.json
└── README.md
```

### GitOps Branch

```
Myntra-Clone-Sample-App (gitops)
└── k8s/app/deployment-service.yml
```

---

##  Quick Start

```bash
# Clone repository
git clone https://github.com/tribhuwanpandey/Myntra-Clone-Sample-App.git
cd Myntra-Clone-Sample-App

# Setup GitOps branch
./setup-gitops.sh

# Configure Terraform
cd terraform
cp terraform.tfvars.example terraform.tfvars

# Deploy infrastructure
make deploy

# Access ArgoCD
make argocd-password
make argocd-ui

# Get application URL
make app-url

# Cleanup
make destroy
```

---

##  Notes
- Ensure GitHub secrets are configured for AWS and ECR access  
- ArgoCD continuously syncs manifests from the GitOps branch  
- All deployments follow GitOps best practices  

---

## Monitoring

### Node status

kubectl get nodes

![alt text](<Screenshot 2026-01-19 192704.png>)

### Pod status

kubectl get pods -o wide

![alt text](<Screenshot 2026-01-19 192729.png>)

### Service status

kubectl get svc

![alt text](<Screenshot 2026-01-19 192748.png>)

### Events

kubectl get events --sort-by='.lastTimestamp'

![alt text](<Screenshot 2026-01-19 192825.png>)


## ArgoCD Monitoring

![alt text](<Screenshot 2026-01-19 192222.png>)

![alt text](<Screenshot 2026-01-19 192200.png>)


## Amazon ECR  

![alt text](<Screenshot 2026-01-19 191836.png>)

### Images

![alt text](<Screenshot 2026-01-19 191822.png>)

