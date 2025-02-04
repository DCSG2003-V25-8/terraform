resource "openstack_compute_instance_v2" "webServer" {
  count = 2
  name = "Terraform webserver${count.index+1}"
  image_name = "Ubuntu Server 22.04 LTS (Jammy Jellyfish) amd64"
  flavor_name = "gx1.1c1r"
  key_pair = openstack_compute_keypair_v2.MasterKey.name
  security_groups = ["default"]
}