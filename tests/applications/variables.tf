variable "tfc_organization" {
  type        = string
  description = "TFC Organization for remote state of infrastructure"
  default     = "tpmm-org-platform-engineering"
}

data "terraform_remote_state" "infrastructure" {
  backend = "remote"

  config = {
    organization = var.tfc_organization
    workspaces = {
      name = "terraform-aws-postgres-waypoint-test-setup"
    }
  }
}

locals {
  region           = "us-west-2"
  eks_cluster_name = data.terraform_remote_state.infrastructure.outputs.eks_cluster_id
}

variable "aws_eks_cluster_id" {
  type        = string
  description = "AWS EKS Cluster ID"
  default     = ""
}

variable "region" {
  type        = string
  description = "AWS Region"
  default     = ""
}

variable "argocd_helm_version" {
  type        = string
  description = "ArgoCD Helm version"
  default     = "5.45.2"
}