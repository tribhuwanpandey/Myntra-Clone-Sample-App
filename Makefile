.PHONY: help init plan apply destroy clean

CLUSTER_NAME := myntra-clone-dev
REGION := ap-south-1

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

init: ## Initialize Terraform
	cd terraform && terraform init

validate: ## Validate Terraform configuration
	cd terraform && terraform validate

plan: ## Plan Terraform changes
	cd terraform && terraform plan

apply: ## Apply Terraform changes
	cd terraform && terraform apply -auto-approve

destroy: ## Destroy all resources
	cd terraform && terraform destroy -auto-approve

kubeconfig: ## Configure kubectl
	aws eks update-kubeconfig --region $(REGION) --name $(CLUSTER_NAME)

argocd-password: ## Get ArgoCD admin password
	@kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d && echo

argocd-ui: ## Port forward ArgoCD UI
	kubectl port-forward svc/argocd-server -n argocd 8080:443

app-url: ## Get application URL
	@kubectl get svc myntra-clone -o jsonpath='{.status.loadBalancer.ingress[0].hostname}' && echo

pods: ## Get pods
	kubectl get pods -o wide

logs: ## Get application logs
	kubectl logs -l app=myntra-clone -f --tail=50

deploy: ## Full deployment
	@$(MAKE) init
	@$(MAKE) apply
	@$(MAKE) kubeconfig

clean: ## Clean Terraform files
	cd terraform && rm -rf .terraform terraform.tfstate* .terraform.lock.hcl

status: ## Check cluster status
	@echo "Cluster Status:"
	@kubectl get nodes
	@echo "\nPods:"
	@kubectl get pods
	@echo "\nServices:"
	@kubectl get svc
