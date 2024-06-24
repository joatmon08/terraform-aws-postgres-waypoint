terraform {
  required_version = "~> 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.55"
    }
    boundary = {
      source  = "hashicorp/boundary"
      version = ">= 1.1"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 4.3"
    }
    consul = {
      source  = "hashicorp/consul"
      version = ">= 2.20"
    }
    hcp = {
      source  = "hashicorp/hcp"
      version = ">= 0.92"
    }
  }
}

provider "aws" {}

provider "hcp" {}

provider "boundary" {
  addr                   = local.boundary_address
  auth_method_login_name = local.boundary_username
  auth_method_password   = local.boundary_password
}

provider "consul" {
  address    = local.consul_address
  token      = local.consul_token
  datacenter = local.consul_datacenter
}

provider "vault" {
  address   = local.vault_address
  token     = local.vault_token
  namespace = local.vault_namespace
}