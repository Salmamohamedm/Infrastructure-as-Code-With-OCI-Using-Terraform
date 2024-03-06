
resource "oci_core_security_list" "securitylist" {
  display_name   = "SL_public"
  compartment_id = var.compartment_id
  vcn_id         = var.vcn_id

  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }

  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/8"

    tcp_options {
      min = 80
      max = 80
    }

    tcp_options {
      min = 22
      max = 22
    }
  }
}

