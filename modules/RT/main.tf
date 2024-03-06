resource "oci_core_route_table" "PublicRT" {
  compartment_id = var.compartment
  vcn_id         = var.vcn_id
  display_name   = "${var.vcn_dns_label}-pubrt"

  route_rules {
    destination         = "0.0.0.0/0"
    network_entity_id   = var.network_entity_id 
  }
}
