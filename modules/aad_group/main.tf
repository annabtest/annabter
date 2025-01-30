resource "azuread_group" "example" {
  display_name     = var.group_name
  security_enabled = true

  members = [var.members]
}

resource "azurerm_role_assignment" "example" {
  scope                = var.scope
  role_definition_name = "AcrPull"
  principal_id         = azuread_group.example.id
}
