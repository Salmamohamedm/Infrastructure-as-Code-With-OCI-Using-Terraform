# Internet Gateway

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment
  display_name   = "${var.vcn_dns_label}-igw"
  vcn_id         = var.vcn_id
}

