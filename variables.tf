variable "resource_group" {
  type        = string
  description = "(optional) describe your variable"
}
variable "location" {
  type        = string
  description = "(optional) describe your variable"
}
variable "tags" {
  type        = map(string)
  description = "(optional) describe your variable"
}

variable "event_hub_namespace_name" {
  type        = string
  description = "(optional) describe your variable"
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "(optional) describe your variable"
}

variable "capacity" {
  type        = number
  default     = 1
  description = "(optional) describe your variable"
}

variable "auto_inflate_enabled" {
  type        = bool
  default     = false
  description = "(optional) describe your variable"
}

variable "maximum_throughput_units" {
  type        = number
  default     = 1
  description = "(optional) describe your variable"
}

variable "zone_redundant" {
  type        = bool
  default     = false
  description = "(optional) describe your variable"
}

variable "local_authentication_enabled" {
  type        = bool
  description = "(optional) describe your variable"
}

variable "application_name" {
  type = string
  default = "logscale-colector"
  description = "(optional) describe your variable"
}