resource "oci_core_instance" "compute_instance" {
  compartment_id      = var.compartment_id
  shape               = var.shape
  display_name        = var.display_name
  availability_domain = "${var.availability_domain}"
  subnet_id           = var.subnet_id

  metadata {
    ssh_authorized_keys = var.ssh_public_key
  }

