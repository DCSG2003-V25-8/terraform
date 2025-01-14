resource "openstack_compute_instance_v2" "basic" {
  name            = "Terraform loadbalancer"
  image_name        = "Ubuntu Server 22.04 LTS (Jammy Jellyfish) amd64"
  flavor_name       = "gx1.1c1r"
  key_pair = local.keyName
  security_groups = ["default"]
  user_data = templatefile("${path.module}/files/cloud-init.yaml.tftpl", {path = "${path.module}/files"})
#   lifecycle {
#     ignore_changes = [ user_data ]
#   }
}