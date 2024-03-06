resource "oci_core_route_table" "PublicRT" {
  compartment_id = var.compartment_ocid
  vcn_id         = oci_core_virtual_network.vcn.id
  display_name   = "${var.vcn_dns_label}-pubrt"

  route_rules {
    destination         = "0.0.0.0/0"
    network_entity_id   = var.network_entity_id 
  }
}
