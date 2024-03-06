resource "oci_core_subnet" "subnet" {
  availability_domain = var.availability_domain
  compartment_id      = var.compartment
  vcn_id              = var.vcn_id
  cidr_block          = cidrsubnet(var.vcn_cidr, 8, 1)
  display_name        = var.dns_label
 // dns_label           = var.dns_label
  route_table_id      = var.PublicRT.id
  security_list_ids   = [var.securitylist.id]
}

