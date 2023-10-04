output "hcp_boundary_endpoint" {
  value = hcp_boundary_cluster.main.cluster_url
}

output "hcp_boundary_username" {
  value = hcp_boundary_cluster.main.username
}

output "hcp_boundary_password" {
  value     = hcp_boundary_cluster.main.password
  sensitive = true
}

output "hcp_consul_cluster" {
  value = hcp_consul_cluster.main.cluster_id
}

output "hcp_consul_private_address" {
  value = hcp_consul_cluster.main.consul_private_endpoint_url
}

output "hcp_consul_datacenter" {
  value = hcp_consul_cluster.main.datacenter
}

output "hcp_consul_public_address" {
  value = hcp_consul_cluster.main.consul_public_endpoint_url
}

output "hcp_consul_token" {
  value     = hcp_consul_cluster_root_token.token.secret_id
  sensitive = true
}

output "hcp_vault_cluster" {
  value = hcp_vault_cluster.main.cluster_id
}

output "hcp_vault_namespace" {
  value = hcp_vault_cluster.main.namespace
}

output "hcp_vault_private_address" {
  value = hcp_vault_cluster.main.vault_private_endpoint_url
}

output "hcp_vault_public_address" {
  value = hcp_vault_cluster.main.vault_public_endpoint_url
}

output "hcp_vault_token" {
  value     = hcp_vault_cluster_admin_token.cluster.token
  sensitive = true
}

output "name" {
  value = var.name
}

output "eks_cluster_id" {
  value = module.eks.cluster_name
}