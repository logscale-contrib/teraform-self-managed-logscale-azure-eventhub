resource "azurerm_eventhub_namespace" "evh" {
  name                     = var.event_hub_namespace_name
  location                 = var.location
  resource_group_name      = var.resource_group
  sku                      = var.sku
  capacity                 = try(var.capacity, null)
  tags                     = var.tags
  auto_inflate_enabled     = try(var.auto_inflate_enabled, null)
  maximum_throughput_units = try(var.maximum_throughput_units, null)
  zone_redundant           = try(var.zone_redundant, false)
  local_authentication_enabled = try(var.local_authentication_enabled, true)
}