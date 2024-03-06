resource "oci_core_subnet" "subnet" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment_ocid
  vcn_id              = oci_core_virtual_network.vcn.id
  cidr_block          = cidrsubnet(var.vcn_cidr, 8, 1)
  display_name        = var.dns_label
 // dns_label           = var.dns_label
  route_table_id      = oci_core_route_table.PublicRT.id
  security_list_ids   = [oci_core_security_list.securitylist.id]
}

