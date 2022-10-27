variable "example_name" {
  description = "Name to use for the gateway route. Must be between 1 and 255 characters in length"
  type        = string
}
variable "example_mesh_name" {
  description = "Name of the service mesh in which to create the gateway route"
  type        = string
}
variable "simple_name" {
  description = "Name to use for the service mesh. Must be between 1 and 255 characters in length"
  type        = string
}

variable "service1_name" {
  description = "Name to use for the virtual service. Must be between 1 and 255 characters in length"
  type        = string
}
variable "servicea_name" {
  description = "Name of the service mesh in which to create the virtual service. Must be between 1 and 255 characters in length"
  type        = string
}
variable "serviceb_name" {
  description = " Name to use for the virtual router. Must be between 1 and 255 characters in length"
  type        = string
}
variable "port" {
  description = "Port used for the port mapping"
  type        = number
}
variable "protocol" {
  description = "Protocol used for the port mapping"
  type        = string
}
variable "virtual_gateway_name" {
  description = "Name to use for the virtual gateway. Must be between 1 and 255 characters in length."
  type        = string
}
variable "port_mapping_port" {
  description = "Port used for the port mapping"
  type        = number
}
variable "port_mapping_protocol" {
  description = "Protocol used for the port mapping"
  type        = string
}
variable "http_namespace_name" {
  description = "Name to use for the virtual node"
  type        = string
}
variable "serviceb1_name" {
  description = "Name to use for the virtual node"
  type        = string
}

variable "map_port" {
  description = "Port used for the port mapping"
  type        = number
}
variable "map_protocol" {
  description = "Protocol used for the port mapping"
  type        = string
}
variable "health_check_protocol" {
  description = "Protocol for the health check request"
  type        = string
}
variable "health_check_path" {
    description = "Destination path for the health check request"
  type        = string
}
variable "healthy_threshold" {
    description = "Number of consecutive successful health checks that must occur before declaring listener healthy"
  type        = number
}
variable "unhealthy_threshold" {
    description = "Number of consecutive failed health checks that must occur before declaring a virtual node unhealthy"
  type        = number
}
variable "timeout_millis" {
  description = " Timeouts for different protocols"
  type        = number
}
variable "interval_millis" {
  description = "Time period in milliseconds between each health check execution"
  type        = number
}
