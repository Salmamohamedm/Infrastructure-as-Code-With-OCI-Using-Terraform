output "vcn_id" {
  value = oci_core_vcn.vcn.id
}

output "subnet_ids" {
  value = oci_core_subnet.subnets[*].id
}
