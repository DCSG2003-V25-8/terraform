# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "DCSG2003_V25_group8_service"
  tenant_name = "DCSG2003_V25_group8"
  domain_name = "NTNU"
  auth_url    = "https://api.skyhigh.iik.ntnu.no:5000/"
  region      = "SkyHiGh"
  user_domain_name = "Default"
  password = file("./servicePass")
}


resource "openstack_compute_keypair_v2" "Manager" {
  name = "Manager"
  public_key = file("./master.pub")
}
