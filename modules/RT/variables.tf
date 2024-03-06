variable "compartment_id" {}
variable "vcn_id" {}
variable "display_name" {}
variable "route_rules" {
  type = list(object({
    destination       = string
    network_entity_id = string
  }))
}
