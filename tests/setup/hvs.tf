resource "hcp_vault_secrets_app" "test" {
  app_name    = var.name
  description = "For module testing"
}