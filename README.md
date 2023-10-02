# terraform-aws-postgres

Sample module creating RDS PostgreSQL database, Boundary targets, and Consul registration.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |
| <a name="requirement_boundary"></a> [boundary](#requirement\_boundary) | >= 1.0 |
| <a name="requirement_consul"></a> [consul](#requirement\_consul) | >= 2.18 |
| <a name="requirement_hcp"></a> [hcp](#requirement\_hcp) | >= 0.72 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | >= 3.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.19.0 |
| <a name="provider_boundary"></a> [boundary](#provider\_boundary) | 1.1.9 |
| <a name="provider_consul"></a> [consul](#provider\_consul) | 2.18.0 |
| <a name="provider_hcp"></a> [hcp](#provider\_hcp) | 0.72.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.20.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_ecr_repository.module](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [boundary_host_catalog_static.database](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_catalog_static) | resource |
| [boundary_host_set_static.database](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_set_static) | resource |
| [boundary_host_static.database](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/host_static) | resource |
| [boundary_target.database](https://registry.terraform.io/providers/hashicorp/boundary/latest/docs/resources/target) | resource |
| [consul_config_entry.service_defaults](https://registry.terraform.io/providers/hashicorp/consul/latest/docs/resources/config_entry) | resource |
| [consul_node.database](https://registry.terraform.io/providers/hashicorp/consul/latest/docs/resources/node) | resource |
| [consul_service.database](https://registry.terraform.io/providers/hashicorp/consul/latest/docs/resources/service) | resource |
| [hcp_vault_secrets_secret.db_password](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_secrets_secret) | resource |
| [hcp_vault_secrets_secret.db_username](https://registry.terraform.io/providers/hashicorp/hcp/latest/docs/resources/vault_secrets_secret) | resource |
| [random_password.database](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |
| [random_pet.database](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [vault_database_secret_backend_connection.db](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_connection) | resource |
| [vault_database_secret_backend_role.db](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/database_secret_backend_role) | resource |
| [vault_kubernetes_auth_backend_role.db](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kubernetes_auth_backend_role) | resource |
| [vault_mount.db](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.db](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [aws_security_group.database](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [consul_service_health.database](https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/service_health) | data source |
| [terraform_remote_state.boundary](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.infrastructure](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [vault_policy_document.db](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_business_unit"></a> [business\_unit](#input\_business\_unit) | Business unit. Also used as database subnet group | `string` | n/a | yes |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | Database instance class | `string` | `"db.t3.micro"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database name to create in instance | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_postgres_db_version"></a> [postgres\_db\_version](#input\_postgres\_db\_version) | PostgreSQL version | `string` | `"13.11"` | no |
| <a name="input_postgres_port"></a> [postgres\_port](#input\_postgres\_port) | Database port | `number` | `5432` | no |
| <a name="input_tfc_organization"></a> [tfc\_organization](#input\_tfc\_organization) | TFC Organization with infrastructure resources | `string` | `"tpmm-org-platform-engineering"` | no |
| <a name="input_tfc_workspace_boundary"></a> [tfc\_workspace\_boundary](#input\_tfc\_workspace\_boundary) | TFC Workspace with Boundary resources | `string` | `"boundary-setup"` | no |
| <a name="input_tfc_workspace_infrastructure"></a> [tfc\_workspace\_infrastructure](#input\_tfc\_workspace\_infrastructure) | TFC Workspace with infrastructure resources | `string` | `"infrastructure"` | no |
| <a name="input_vault_kubernetes_auth_path"></a> [vault\_kubernetes\_auth\_path](#input\_vault\_kubernetes\_auth\_path) | Vault Kubernetes auth path | `string` | `"kubernetes"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_boundary_target_postgres"></a> [boundary\_target\_postgres](#output\_boundary\_target\_postgres) | n/a |
| <a name="output_ecr_repository"></a> [ecr\_repository](#output\_ecr\_repository) | n/a |
| <a name="output_product_database_address"></a> [product\_database\_address](#output\_product\_database\_address) | n/a |
