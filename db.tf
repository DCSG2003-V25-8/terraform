resource "openstack_compute_instance_v2" "name" {
  name = "Terraform db"
  image_name = "Ubuntu Server 22.04 LTS (Jammy Jellyfish) amd64"
  flavor_name = "gx1.1c1r"
  key_pair = openstack_compute_keypair_v2.MasterKey.name
  security_groups = ["default"]
  power_state = "active"
}