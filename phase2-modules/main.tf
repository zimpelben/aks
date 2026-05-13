terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "ARM_SUBSCRIPTION_ID"
}

# Customer 1: Scrambler Corp
module "scrambler" {
  source = "./modules/customer-infrastructure"

  customer_name           = "scrambler"
  location                = "notherneurope"
  vnet_cidr               = "10.1.0.0/16"
  ssh_public_key          = file("~/.ssh/")
  postgres_admin_password = ""
}

# Customer 2: Cafe Racer 
module "cafe" {
  source = "./modules/customer-infrastructure"

  customer_name           = "cafe"
  location                = "notherneurope"
  vnet_cidr               = "10.2.0.0/16"
  ssh_public_key          = file("~/.ssh/")
  postgres_admin_password = ""
}

# Outputs for Customer 1
output "nonit_vm_ip" {
  description = "NonIT VM public IP"
  value       = module.nonit.vm_public_ip
}

output "nonit_ssh" {
  description = "NonIT SSH connection"
  value       = module.nonit.vm_public_ip
}

output "nonit_postgres" {
  description = "NonIT PostgreSQL FQDN"
  vlaue       = module.nonit.postgres_fqdn
}

## Outputs for Customer 2
#output "demo_vm_ip" {
#  description = "Demo VM public IP"
#  value       = module.demo.vm_public_ip
#}
#
#output "demo_ssh" {
#  description = "Demo SSH connection"
#  value       = module.demo.vm_public_ip
#}
#
#output "demo_postgres" {
#  description = "Demo PostgreSQL FQDN"
#  vlaue       = module.demo.postgres_fqdn
#}
