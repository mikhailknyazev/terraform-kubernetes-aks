# Storage Accounts

resource "azurerm_storage_account" "sa_vault" {
  name                     = "${var.prefix}vault${random_string.vault_storage_account.result}"
  location                 = "${azurerm_resource_group.rg_vault.location}"
  resource_group_name      = "${azurerm_resource_group.rg_vault.name}"
  account_tier             = "Standard"
  account_kind             = "BlobStorage"
  account_replication_type = "LRS"
  # enable_blob_encryption = "True"
  # enable_file_encryption = "True"
  access_tier = "Hot"
}

resource "azurerm_storage_container" "sc_vault" {
  name                  = "vault"
  resource_group_name   = "${azurerm_resource_group.rg_vault.name}"
  storage_account_name  = "${azurerm_storage_account.sa_vault.name}"
  container_access_type = "private"
}

resource "azurerm_storage_account" "sa_velero" {
  name                     = "${var.prefix}velero${random_string.velero_storage_account.result}"
  location                 = "${azurerm_resource_group.rg_velero.location}"
  resource_group_name      = "${azurerm_resource_group.rg_velero.name}"
  account_tier             = "Standard"
  account_kind             = "BlobStorage"
  account_replication_type = "LRS"
  # enable_blob_encryption = "True"
  # enable_file_encryption = "True"
  access_tier = "Hot"
}

resource "azurerm_storage_container" "sc_velero" {
  name                  = "velero"
  resource_group_name   = "${azurerm_resource_group.rg_velero.name}"
  storage_account_name  = "${azurerm_storage_account.sa_velero.name}"
  container_access_type = "private"
}
