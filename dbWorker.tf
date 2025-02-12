resource "openstack_compute_instance_v2" "db_worker" {
  name = "tf-db-worker"
  image_id = "406238e3-bac8-4e78-80ac-911d47d46c14"
  flavor_name = "sx3.12c24r"
  key_pair = openstack_compute_keypair_v2.Manager.name
  security_groups = ["default"]
  power_state = "active"
  user_data = file("./dbWorker.yaml")
}

resource "openstack_compute_volume_attach_v2" "vl_1" {
  instance_id = openstack_compute_instance_v2.db_worker.id
  volume_id = "7a20a40e-6aac-4441-9956-1f701a42d789"
}