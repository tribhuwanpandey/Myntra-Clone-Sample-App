# GitOps Branch

This branch contains **only Kubernetes manifests** required for application deployment.

⚠️ **DO NOT modify this branch manually.**  
This branch is **automatically updated** by the GitHub Actions CI/CD pipeline.

---

## Structure

```text
k8s/
└── app/
    └── deployment-service.yml
```

## Workflow

1. Code pushed to `main` branch
2. GitHub Actions builds Docker image
3. Image pushed to ECR
4. GitHub Actions updates image tag in this branch
5. ArgoCD syncs changes to EKS cluster
