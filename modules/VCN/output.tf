output "vcn_id" {
  description = "The OCID of the VCN."
  value       = oci_core_virtual_network.vcn.id
}

output "subnet_ids" {
  value = oci_core_subnet.subnets[*].id
}

