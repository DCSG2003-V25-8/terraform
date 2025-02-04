resource "openstack_networking_floatingip_v2" "floatip_1" {
  pool = "ntnu-internal"
}

data "openstack_networking_port_v2" "vm-port" {
  device_id  = openstack_compute_instance_v2.worker.id
  network_id = "35fe8b76-cc31-4b48-b3f0-5c48eef8d289"
}

resource "openstack_networking_floatingip_associate_v2" "myip" {
  floating_ip = openstack_networking_floatingip_v2.floatip_1.address
  port_id     = data.openstack_networking_port_v2.vm-port.id
}


resource "openstack_compute_instance_v2" "worker" {
  name = "tf-ingress"
  image_id = "406238e3-bac8-4e78-80ac-911d47d46c14"
  flavor_name = "gx1.1c1r"
  key_pair = openstack_compute_keypair_v2.Manager.name
  security_groups = ["default"]
  power_state = "active"
  user_data = templatefile("./ingress.yaml", file("./githubPat"))
}

