data "azurerm_subscriptions" "available" {
    display_name_contains = var.ARM_SUBSCRIPTION_ID
}
resource "azuread_group" "example" {
  display_name     = var.group_name
  security_enabled = true

  members = [var.members]
}

resource "azurerm_role_assignment" "example" {
  scope                = data.azurerm_subscriptions.available.id
  role_definition_name = "ArcPull"
  principal_id         = azuread_group.example.id
}