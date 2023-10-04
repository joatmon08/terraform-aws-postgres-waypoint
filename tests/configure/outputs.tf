output "boundary_scope_ids" {
  value = {
    "modules" = boundary_scope.test.id
  }
}

output "boundary_credentials_store_ids" {
  value = {
    "modules" = boundary_credential_store_vault.test.id
  }
}