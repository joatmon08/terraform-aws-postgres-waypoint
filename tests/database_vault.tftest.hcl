variables {
  business_unit                = "modules"
  environment                  = "dev"
  db_name                      = "test"
  tfc_workspace_infrastructure = "terraform-aws-postgres-waypoint-test-setup"
  tfc_workspace_boundary       = "terraform-aws-postgres-waypoint-test-configure"
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Business_Unit = "modules"
      Environment   = "dev"
      Automation    = "terraform"
      Repo          = "terraform-aws-postgres-waypoint"
    }
  }
}

run "database" {
  command = plan

  assert {
    condition     = !aws_db_instance.database.publicly_accessible
    error_message = "Database in module should not be publicly accessible"
  }

  assert {
    condition     = aws_db_instance.database.storage_encrypted
    error_message = "Database in module should be encrypted"
  }

  assert {
    condition     = aws_db_instance.database.manage_master_user_password == null
    error_message = "Database password should be stored in Vault and not managed by AWS"
  }
}

# run "setup" {
#   command = apply

#   assert {
#     condition     = aws_db_instance.database.status == "available"
#     error_message = "Database in module should be available"
#   }

#   assert {
#     condition     = length(data.consul_service_health.database.results) > 0
#     error_message = "Database service not registered in Consul"
#   }
# }
