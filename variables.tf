variable "tfc_organization" {
  type        = string
  description = "TFC Organization with infrastructure resources"
  default     = "hashicorp-stack-demoapp"
}

variable "tfc_workspace_infrastructure" {
  type        = string
  description = "TFC Workspace with infrastructure resources"
  default     = "infrastructure"
}

variable "tfc_workspace_boundary" {
  type        = string
  description = "TFC Workspace with Boundary resources"
  default     = "boundary-setup"
}

variable "tfc_workspace_applications" {
  type        = string
  description = "TFC Workspace with application setup resources"
  default     = "applications"
}

data "terraform_remote_state" "infrastructure" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.tfc_workspace_infrastructure
    }
  }
}

data "terraform_remote_state" "boundary" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.tfc_workspace_boundary
    }
  }
}

data "terraform_remote_state" "applications" {
  backend = "remote"
  config = {
    organization = var.tfc_organization
    workspaces = {
      name = var.tfc_workspace_applications
    }
  }
}

locals {
  boundary_address  = data.terraform_remote_state.infrastructure.outputs.hcp_boundary_endpoint
  boundary_username = data.terraform_remote_state.infrastructure.outputs.hcp_boundary_username
  boundary_password = data.terraform_remote_state.infrastructure.outputs.hcp_boundary_password

  consul_address    = data.terraform_remote_state.infrastructure.outputs.hcp_consul_public_address
  consul_token      = data.terraform_remote_state.infrastructure.outputs.hcp_consul_token
  consul_datacenter = data.terraform_remote_state.infrastructure.outputs.hcp_consul_datacenter

  vault_address   = data.terraform_remote_state.infrastructure.outputs.hcp_vault_public_address
  vault_namespace = data.terraform_remote_state.infrastructure.outputs.hcp_vault_namespace
  vault_token     = data.terraform_remote_state.infrastructure.outputs.hcp_vault_token

  boundary_scope_id             = data.terraform_remote_state.applications.outputs.boundary_scope_ids[var.business_unit]
  boundary_credentials_store_id = data.terraform_remote_state.applications.outputs.boundary_credentials_store_ids[var.business_unit]
}

variable "postgres_db_version" {
  type        = string
  default     = "16.1"
  description = "PostgreSQL version"
}

variable "postgres_port" {
  type        = number
  description = "Database port"
  default     = 5432
}

variable "db_instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "Database instance class"
}

variable "business_unit" {
  type        = string
  description = "Business unit. Also used as database subnet group"
}

variable "environment" {
  type        = string
  description = "Environment"
}

variable "db_name" {
  type        = string
  description = "Database name to create in instance"
}

variable "org_name" {
  type        = string
  description = "Org name. Also used as db subnet group name"
}

variable "vault_kubernetes_auth_path" {
  type        = string
  description = "Vault Kubernetes auth path"
  default     = "kubernetes"
}

variable "additional_service_account_names" {
  type        = list(string)
  description = "Additional service account names to allow access to database credentials"
  default     = []
}

locals {
  tags = {
    Environment   = var.environment
    Automation    = "terraform"
    Business_Unit = var.business_unit
  }
  db_subnet_group_name = var.org_name
}