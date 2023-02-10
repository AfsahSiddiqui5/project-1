resource "azuread_user" "me" {
  user_principal_name = var.my-UPN
  display_name        = var.my-display_name
}

resource "azuread_user" "trainer" {
  user_principal_name = var.trainer-UPN
  display_name        = var.trainer-display_name
  force_password_change = true
}

resource "aws_iam_user" "users-on-aws" {
    for_each = toset(var.users)
    name = each.value
}

resource "aws_s3_bucket" "buckets" {
  bucket = "${var.bucket-name}-${count.index}"
  count = var.total-buckets

  tags = {
    Environment = var.dev-env
  }
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource-group-name
  location = var.rg-location
}

resource "azurerm_virtual_network" "vn" {
  name                = var.vnetwork-name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "sbn" {
  name                 = var.sbn-name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefixes     = var.address_prefixes
}

resource "azurerm_network_interface" "ni" {
  name                = var.ni-name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.ip-config-name
    subnet_id                     = azurerm_subnet.sbn.id
    private_ip_address_allocation = var.ip_allocation_type
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm-name
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.ni.id]
  vm_size               = var.vm-size

  storage_os_disk {
    name              = var.disk-name
    caching           = var.rw
    create_option     = var.createfrom
    managed_disk_type = var.disktype
  }  
}

resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sa-tier
  account_replication_type = var.rep_type

  tags = {
    Environment = var.staging-env
  }
}