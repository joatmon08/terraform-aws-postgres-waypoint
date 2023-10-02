variable "tfc_organization" {
  type        = string
  description = "TFC Organization with infrastructure resources"
  default     = "tpmm-org-platform-engineering"
}

variable "tfc_workspace_infrastructure" {
  type        = string
  description = "TFC Workspace with infrastructure resources"
  default     = "infrastructure"
}

variable "tfc_workspace_boundary" {
  type        = string
  description = "TFC Workspace with Boundary resources"
  default     = "boundary"
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

  boundary_scope_id = data.terraform_remote_state.boundary.outputs.products_infra_scope_id
}

variable "boundary_scope_id" {
  type        = string
  description = "Boundary scope ID for setting up target to database"
}

variable "postgres_db_version" {
  type        = string
  default     = "13.11"
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

variable "vault_kubernetes_auth_path" {
  type        = string
  description = "Vault Kubernetes auth path"
  default     = "kubernetes"
}

locals {
  tags = {
    Environment   = var.environment
    Automation    = "terraform"
    Business_Unit = var.business_unit
  }
  db_subnet_group_name = var.business_unit
}