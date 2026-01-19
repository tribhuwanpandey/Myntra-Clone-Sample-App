################################################################################
# General
################################################################################

variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "myntra-clone"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Project owner"
  type        = string
  default     = "devops-team"
}

################################################################################
# VPC
################################################################################

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "single_nat_gateway" {
  description = "Use single NAT Gateway (cost optimization for dev)"
  type        = bool
  default     = true
}

################################################################################
# EKS
################################################################################

variable "k8s_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "node_instance_types" {
  description = "EC2 instance types for nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "capacity_type" {
  description = "Node capacity type (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "node_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 2
}

variable "node_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 4
}

variable "node_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

################################################################################
# ECR
################################################################################

variable "ecr_repository" {
  description = "ECR repository name"
  type        = string
  default     = "myntra-clone"
}

variable "ecr_image_retention_count" {
  description = "Number of images to retain in ECR"
  type        = number
  default     = 10
}

################################################################################
# ArgoCD & GitOps
################################################################################

variable "gitops_repo_url" {
  description = "GitOps repository URL"
  type        = string
  default     = "https://github.com/vaishnaviamati/gitopsinfra"
}

variable "gitops_branch" {
  description = "GitOps repository branch"
  type        = string
  default     = "main"
}

variable "gitops_path" {
  description = "Path in GitOps repo containing manifests"
  type        = string
  default     = "k8s/app"
}

variable "app_name" {
  description = "Application name"
  type        = string
  default     = "myntra-clone"
}

variable "app_namespace" {
  description = "Kubernetes namespace for application"
  type        = string
  default     = "default"
}
