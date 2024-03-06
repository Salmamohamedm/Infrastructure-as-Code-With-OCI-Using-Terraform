# Deploying Workloads on Oracle Cloud Infrastructure (OCI) via Terraform 
This repository contains Terraform configurations to deploy workloads on Oracle Cloud Infrastructure (OCI). Terraform is an Infrastructure as Code tool that allows you to define and provision cloud infrastructure using declarative configuration files.

![image](https://github.com/Salmamohamedm/Infrastructure-as-Code-With-OCI-Using-Terraform/assets/109488469/8f39feb9-f972-41f7-a7c7-74cc72a987f7)
# Prerequisites
Before you begin, ensure you have the following:
1. An Oracle Cloud Infrastructure (OCI) account. You can sign up [here](https://www.oracle.com/cloud/sign-in.html).
2. Terraform installed on your local machine.
3. Oracle Cloud Infrastructure (OCI) Terraform Provider. Installation instructions can be found [here](https://registry.terraform.io/providers/oracle/oci/latest/docs).

# Overview
1. [main.tf](main.tf)
   - Define the cloud provider, Call terraform modules.
2. [variables.tf](Terraform-Project/main.tf)
    -  Configure variables that need to be defined in terraform.tfvar file.
3.   [terraform.tfvars](terraform.tfvars)
     - Provide values for the required variables

