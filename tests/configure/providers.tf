terraform {
  required_providers {
    boundary = {
      source  = "hashicorp/boundary"
      version = "~> 1.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = "~> 3.20"
    }
  }
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

provider "boundary" {
  addr                   = data.terraform_remote_state.infrastructure.outputs.hcp_boundary_endpoint
  auth_method_login_name = data.terraform_remote_state.infrastructure.outputs.hcp_boundary_username
  auth_method_password   = data.terraform_remote_state.infrastructure.outputs.hcp_boundary_password
}

provider "vault" {
  address   = data.terraform_remote_state.infrastructure.outputs.hcp_vault_public_address
  token     = data.terraform_remote_state.infrastructure.outputs.hcp_vault_token
  namespace = data.terraform_remote_state.infrastructure.outputs.hcp_vault_namespace
}