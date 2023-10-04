resource "boundary_scope" "org" {
  scope_id                 = "global"
  name                     = data.terraform_remote_state.infrastructure.outputs.name
  description              = "HashiCups scope"
  auto_create_default_role = true
  auto_create_admin_role   = true
}

// create a project for test
resource "boundary_scope" "test" {
  name                     = "test"
  description              = "test project"
  scope_id                 = boundary_scope.org.id
  auto_create_admin_role   = true
  auto_create_default_role = true
}

resource "vault_token" "boundary_controller" {
  policies          = []
  no_default_policy = false
  no_parent         = true
  ttl               = "3d"
  explicit_max_ttl  = "6d"
  period            = "3d"
  renewable         = true
  num_uses          = 0
}

resource "boundary_credential_store_vault" "test" {
  name        = "vault"
  description = "Vault credentials store"
  address     = data.terraform_remote_state.infrastructure.outputs.hcp_vault_public_address
  token       = vault_token.boundary_controller.client_token
  namespace   = data.terraform_remote_state.infrastructure.outputs.hcp_vault_namespace
  scope_id    = boundary_scope.test.id
}