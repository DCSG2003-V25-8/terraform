locals {
  haproxy_config = base64encode(templatefile("${path.module}/files/loadbalancer/haproxy.cfg.tftpl", {ips = openstack_compute_instance_v2.webServer.*.access_ip_v4}))
}

resource "openstack_compute_instance_v2" "loadbalancer" {
  name            = "Terraform loadbalancer"
  image_name        = "Ubuntu Server 22.04 LTS (Jammy Jellyfish) amd64"
  flavor_name       = "gx1.1c1r"
  key_pair = openstack_compute_keypair_v2.MasterKey.name
  security_groups = ["default"]
}