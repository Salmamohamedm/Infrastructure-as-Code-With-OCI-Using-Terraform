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
2. [variables.tf](variables.tf)
    -  Configure variables that need to be defined in terraform.tfvar file.
3.   [terraform.tfvars](terraform.tfvars)
     - Provide values for the required variables
4. [modules](modules)
    - a modules file is a directory containing reusable configurations encapsulating resources and modularization in infrastructure as code deployments.


# Configuration
1. Clone this repository to your local machine:

```
git clone https://github.com/Salmamohamedm/Infrastructure-as-Code-With-OCI-Using-Terraform.git
```
2. Navigate to the cloned directory:
```
cd Infrastructure-as-Code-With-OCI-Using-Terraform
```
3. Update the terraform.tfvars file with your OCI credentials and other configuration settings.
4. Review and customize the Terraform configuration files (*.tf) as needed for your specific workloads.

# Deployment
To deploy the workloads on OCI, follow these steps:
1. Initialize the Terraform configuration:
```
terraform init
```
2. View the execution plan to ensure everything will be created as expected:
```
terraform plan
```
3. Apply the Terraform configuration to create the resources:
```
terraform apply
```
4. Review the proposed changes and type "yes" to confirm the deployment.





