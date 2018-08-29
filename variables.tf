# Parameters regarding azure
variable "subscription_id_value" {
  type        = "string"
  description = "Enter subscription value"
  default = "00000-0000-00000-000"

}

variable "client_id_value" {
  type        = "string"
  description = "Enter client id value"
  default = "00000-0000-00000-000"
}

variable "client_secret_value" {
  type        = "string"
  description = "Enter client secret value"
  default = "00000-0000-00000-000"
}

variable "tenant_id_value" {
  type        = "string"
  description = "Enter tenant id value"
  default = "00000-0000-00000-000"
}

# Paramaters regarding resource group

variable "azure_resource_group_name" {
  type        = "string"
  description = "Resource group name"
  default     = "test-azure"
}

variable "location" {
  type        = "string"
  description = "Location of the azure resource group"
  default     = "west europe"
}


variable "tags" {
  description = "Default tags to apply on resources"
  type        = "map"

  default = {
    Environment = "Test"
    Company   = "CompanyName"
  }
}

# Parameters regarding storage account
variable "storage_account_name" {
  type        = "string"
  description = "Storage account name"
  default     = "teststorage"
}

variable "account_tier" {
  type        = "string"
  description = "account tier"
  default     = "Standard"
}

variable "replication_type" {
  type        = "string"
  description = "encryption type"
  default     = "LRS"
}

variable "blob_encryption" {
  description = "Boolean flag which controls if Encryption Services are enabled for Blob storage."
  type        = "string"
  default     = true
}

variable "file_encryption" {
  description = "Boolean flag which controls if Encryption Services are enabled for File storage."
  type        = "string"
  default     = true
}


variable "account_encryption_source" {
  description = "The Encryption Source for this Storage Account. Possible values are Microsoft.Keyvault and Microsoft.Storage. Defaults to Microsoft.Storage."
  type        = "string"
  default     = "Microsoft.Storage"
}

# Parameters regardin vnet
variable "vnet_name" {
  type        = "string"
  description = "vnet name"
  default     = "test-azure-vnet"
}

variable "vnet_ip_range" {
  type        = "list"
  description = "IP range for vnet"
  default     = ["172.16.0.0/12"]
}

variable "subnet1_ip_range" {
  type        = "string"
  description = "IP range for subnet 1"
  default     = "172.16.1.0/24"
}
variable "subnet2_ip_range" {
  type        = "string"
  description = "IP range for subnet 2"
  default     = "172.16.2.0/24"
}
variable "subnet3_ip_range" {
  type        = "string"
  description = "IP range for subnet 3"
  default     = "172.16.3.0/24"
}
