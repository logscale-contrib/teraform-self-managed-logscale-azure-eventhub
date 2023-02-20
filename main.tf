resource "azurerm_eventhub_namespace" "evh" {
  name                         = var.event_hub_namespace_name
  location                     = var.location
  resource_group_name          = var.resource_group
  sku                          = var.sku
  capacity                     = try(var.capacity, null)
  tags                         = var.tags
  auto_inflate_enabled         = try(var.auto_inflate_enabled, null)
  maximum_throughput_units     = try(var.maximum_throughput_units, null)
  zone_redundant               = try(var.zone_redundant, false)
  local_authentication_enabled = try(var.local_authentication_enabled, true)
}

resource "azurerm_eventhub" "hubs" {
  count               = length(var.hubs)
  name                = var.hubs[count.index].name
  namespace_name      = azurerm_eventhub_namespace.evh.name
  resource_group_name = var.resource_group
  partition_count     = try(var.hubs[count.index].partition_count, 2)
  message_retention   = try(var.hubs[count.index].message_retention, 1)
}


resource "azurerm_monitor_aad_diagnostic_setting" "example" {
  name                           = "eventhub"
  eventhub_authorization_rule_id = azurerm_eventhub_namespace.evh.id
  eventhub_name                  = "azuread"
  log {
    category = "SignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "AuditLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "NonInteractiveUserSignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "ServicePrincipalSignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "ManagedIdentitySignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "ProvisioningLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
  log {
    category = "ADFSSignInLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 1
    }
  }
}
