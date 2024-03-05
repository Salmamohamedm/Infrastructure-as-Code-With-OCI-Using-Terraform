provider "oci" {
  tenancy_ocid         = var.tenancy_id
  user_ocid            = var.user_id
  fingerprint          = var.api_fingerprint
  private_key_path     = var.api_private_key_path
  region               = var.region
  disable_auto_retries = false
}


module "vcn" {
  source  = "./modules/VCN"

  # general oci parameters
  compartment_id = var.compartment_id
//  label_prefix   = var.label_prefix

  # vcn parameters
  create_internet_gateway = var.create_internet_gateway
 // create_nat_gateway      = var.create_nat_gateway
 // create_service_gateway  = var.create_service_gateway
  tags                     = var.freeform_tags
  vcn_cidrs                = var.vcn_cidrs
  vcn_dns_label            = var.vcn_dns_label
  vcn_name                 = var.vcn_name
  lockdown_default_seclist = var.lockdown_default_seclist
  attached_drg_id          = var.attached_drg_id
}

module "subnet" {
  source = "./modules/subnet"

  compartment_id = var.compartment_id
  tenancy_id     = var.tenancy_id
  subnets        = var.subnets
  enable_ipv6    = var.enable_ipv6
  vcn_id         = oci_core_vcn.vcn.id
  ig_route_id    = var.create_internet_gateway ? oci_core_route_table.ig[0].id : null
 // nat_route_id   = var.create_nat_gateway ? oci_core_route_table.nat[0].id : null

  freeform_tags = var.freeform_tags

  count = length(var.subnets) > 0 ? 1 : 0

}
module "Compute" {
  source = "./modules/Compute"

  compartment_id  = "your_compartment_id"
  subnet_id       = "your_subnet_id"
  ssh_public_key  = "your_ssh_public_key"
  shape           = "VM.Standard2.1"
  image_id        = "your_image_id"
  display_name    = "ExampleComputeInstance"
}
