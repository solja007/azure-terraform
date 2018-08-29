## Description                    
The template deploys base stack to the Azure cloud platform. Stack deploys:
- Resource group
- Storage account
- Virtual network (v-net)
- 3 subnets
- Policy definition
- Policy assignment to Resource group and subscription

## Requirments
- Azure account
- terraform (tested with terraform v0.11.5 and azurerm v1.13.0)
- azure-cli

## Parameters file (variables.tf)
This files contains parameters for running main terraform file
Parameters (String if no otherwise declared):
- subscription_id_value (Enter subscription value)
- client_id_value (Enter client id value)
- client_secret_value (Enter client secret value)
- tenant_id_value (Enter tenant id value)
- azure_resource_group_name (Resource group name)
- location (Location of the azure resource group)
- tags (Default tags to apply on resources)
- storage_account_name (Storage account name)
- account_tier (Account tier)
- replication_type (encryption type)
- blob_encryption (Boolean flag which controls if Encryption Services are enabled for Blob storage)
- file_encryption (Boolean flag which controls if Encryption Services are enabled for File storage)
- account_encryption_source (The Encryption Source for this Storage Account. Possible values are Microsoft.Keyvault and Microsoft.Storage. Defaults to Microsoft.Storage)
- vnet_name (vnet name)
- vnet_ip_range (IP range for vnet) (list)
- subnet1_ip_range (IP range for subnet 1)
- subnet2_ip_range (IP range for subnet 2)
- subnet3_ip_range (IP range for subnet 3)

## Deployment steps
- clone repository to local machine/instance
- navigate to the folder with files
- enter parameters
- run "terraform init"
- run "terrafrom plan"
- run "terraform apply"

## Cleanup
- navigate to the folder with files
- run "terraform destroy"
