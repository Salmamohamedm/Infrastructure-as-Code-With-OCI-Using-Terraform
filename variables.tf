
# provider identity parameters
variable "api_fingerprint" {
  description = "fingerprint of oci api private key"
  type        = string
 
}

variable "api_private_key_path" {
  description = "path to oci api private key used"
  type        = string
 
}

variable "region" {
  description = "the oci region where resources will be created"
  type        = string
  
}

variable "tenancy_id" {
  description = "tenancy id where to create the sources"
  type        = string
 
}

variable "user_id" {
  description = "id of user that terraform will use to create the resources"
  type        = string
  
}

# general oci parameters

variable "compartment_id" {
  description = "compartment id where to create all resources"
  type        = string
 
}


# vcn parameters


variable "vcn_cidr" {
  description = "The list of IPv4 CIDR blocks the VCN will use."
  type        = list(string)
  default     = ["10.0.0.0/16", "172.16.0.0/16", "192.168.0.0/24"]
}

variable "vcn_dns_label" {
  description = "A DNS label for the VCN, used in conjunction with the VNIC's hostname and subnet's DNS label to form a fully qualified domain name (FQDN) for each VNIC within this subnet"
  type        = string
  default     = "vcnmodule"
}

variable "vcn_name" {
  description = "user-friendly name of to use for the vcn to be appended to the label_prefix"
  type        = string
  default     = "vcn"
}

# compute instance parameters

variable "availability_domain" {
  description = "The availability domain where the instance will be launched."
  type        = string
}

variable "display_name" {
  description = "The display name of the instance."
  type        = string
}


variable "shape" {
  description = "The shape of an instance."
  type        = string
  default     = "VM.Standard.E3.Flex"
}

variable "ssh_public_keys" {
  description = "Public SSH keys to be included in the ~/.ssh/authorized_keys file for the default user on the instance. To provide multiple keys, see docs/instance_ssh_keys.adoc."
  type        = string
  default     = null
}




# gateways parameters

// variable "internet_gateway_display_name" {
 // description = "(Updatable) Name of Internet Gateway. Does not have to be unique."
 // type        = string
 // default     = "igw"
// }

# subnet parameters

variable "subnet_id" {
  description = "Private or Public subnets in a VCN"
  type        = any
  default     = {}
}

variable "route_table_id" {
  description = "The OCID of the route table associated with the subnet."
  type        = string
}

variable "security_list_ids" {
  description = "A list of security list OCIDs to associate with the subnet."
  type        = list(string)
}




