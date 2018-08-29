# Configure the Azure Provider
provider "azurerm" {
subscription_id = "${var.subscription_id_value}"
client_id       = "${var.client_id_value}"
client_secret   = "${var.client_secret_value}"
tenant_id       = "${var.tenant_id_value}"

}

resource "azurerm_resource_group" "demorg" {
  name     = "${var.azure_resource_group_name}"
  location = "${var.location}"
  tags     = "${var.tags}"
}
# Configure storage account
resource "azurerm_storage_account" "demosa" {
  name     = "${var.storage_account_name}"
  resource_group_name  = "${azurerm_resource_group.demorg.name}"
  location = "${var.location}"
  account_tier = "${var.account_tier}"
  account_replication_type = "${var.replication_type}"
  enable_blob_encryption = "${var.blob_encryption}"
  enable_https_traffic_only = "${var.file_encryption}"
  account_encryption_source = "${var.account_encryption_source}"
  tags     = "${var.tags}"
}
# Configure virtual network
resource "azurerm_virtual_network" "demovn" {
    name = "${var.vnet_name}"
    address_space = "${var.vnet_ip_range}"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.demorg.name}"

  }

# Configure subnets

resource "azurerm_subnet" "demosubnet1" {
    name                 = "${var.azure_resource_group_name}-Subnet1"
    resource_group_name  = "${azurerm_resource_group.demorg.name}"
    virtual_network_name = "${azurerm_virtual_network.demovn.name}"
    address_prefix       = "${var.subnet1_ip_range}"
  }

resource "azurerm_subnet" "demosubnet2" {
    name                 = "${var.azure_resource_group_name}-Subnet2"
    resource_group_name  = "${azurerm_resource_group.demorg.name}"
    virtual_network_name = "${azurerm_virtual_network.demovn.name}"
    address_prefix       = "${var.subnet2_ip_range}"
  }

resource "azurerm_subnet" "demosubnet3" {
    name                 = "${var.azure_resource_group_name}-Subnet3"
    resource_group_name  = "${azurerm_resource_group.demorg.name}"
    virtual_network_name = "${azurerm_virtual_network.demovn.name}"
    address_prefix       = "${var.subnet3_ip_range}"
  }

# Policy creation
resource "azurerm_policy_definition" "policy" {
  name         = "accessPolicy"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "acceptance test policy definition"
  policy_rule  = <<POLICY_RULE
    {
    "if": {
      "not": {
        "anyOf": [
        {
          "field": "type",
          "like": "Microsoft.Network/*"
        },
        {
          "field": "type",
          "like": "Microsoft.Compute/*"
        },
        {
          "field": "type",
          "like": "Microsoft.Storage/*"
        }
        ]}
  },
    "then": {
      "effect": "deny"
    }
}
POLICY_RULE
}

# Policy assigment
resource "azurerm_policy_assignment" "resource_group_enforcment" {
  name                 = "resource_enforcment"
  scope                = "${azurerm_resource_group.demorg.id}"
  policy_definition_id = "${azurerm_policy_definition.policy.id}"
  description          = "Policy Assignment to resource group"
}

resource "azurerm_policy_assignment" "subscription_enforcment" {
  name                 = "resource_enforcment"
  scope                = "/subscriptions/${var.subscription_id_value}"
  policy_definition_id = "${azurerm_policy_definition.policy.id}"
  description          = "Policy Assignment to subscription"
}
