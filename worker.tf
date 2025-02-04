resource "openstack_compute_instance_v2" "worker" {
  count = 2
  name = "tf-worker${count.index+1}"
  image_id = "406238e3-bac8-4e78-80ac-911d47d46c14"
  flavor_name = "gx1.1c1r"
  key_pair = openstack_compute_keypair_v2.Manager.name
  security_groups = ["default"]
  power_state = "active"
  user_data = file("./worker.yaml")
}