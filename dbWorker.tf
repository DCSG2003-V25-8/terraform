resource "openstack_compute_instance_v2" "db_worker" {
  count = 1
  name = "tf-db-worker${count.index+1}"
  image_name = "Ubuntu Server 22.04 LTS (Jammy Jellyfish) amd64"
  flavor_name = "gx1.1c1r"
  key_pair = openstack_compute_keypair_v2.MasterKey.name
  security_groups = ["default"]
  power_state = "active"
  user_data = file("./cloud-init.yaml")
}