output "check_pw_expiration" {
    value = azuread_user.me.disable_password_expiration
}

output "rg_id" {
    value = azurerm_resource_group.rg.id
}