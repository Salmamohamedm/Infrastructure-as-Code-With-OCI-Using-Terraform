provider "oci" {
  tenancy_ocid         = var.tenancy_id
  user_ocid            = var.user_id
  fingerprint          = var.api_fingerprint
  private_key_path     = var.api_private_key_path
  region               = var.region
  
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
  vcn_id         = module.vcn.vcn_id
  ig_route_id    = var.create_internet_gateway ? oci_core_route_table.ig[0].id : null
 // nat_route_id   = var.create_nat_gateway ? oci_core_route_table.nat[0].id : null

  freeform_tags = var.freeform_tags

  count = length(var.subnets) > 0 ? 1 : 0

}

module "internet_gateway" {
  source = "./modules/IGW"

  compartment_id   = var.compartment_ocid
  vcn_id           = module.vcn.vcn_id
  vcn_dns_label    = var.vcn_dns_label
}


module "compute_instance" {
  source = "./modules/compute_instance"

  compartment_id      = var.compartment_id
  shape               = var.shape
  display_name        = var.display_name
  availability_domain = var.availability_domain
  subnet_id           = var.subnet_id
  ssh_public_key      = var.ssh_public_key
}


module "route_table" {
  source = "./modules/RT"

  compartment_id = var.compartment_id
  vcn_id         = module.vcn.vcn_id
  display_name   = var.route_table_name

  route_rules = [
    {
      destination       = "0.0.0.0/0"
      network_entity_id = module.internet_gateway.internet_gateway_id
    }
  ]
}

