resource "openstack_compute_instance_v2" "webServer" {
  count = 2
  name = "Terraform webserver${count.index+1}"
  image_name = "Ubuntu Server 22.04 LTS (Jammy Jellyfish) amd64"
  flavor_name = "gx1.1c1r"
  key_pair = local.keyName
  security_groups = ["default"]
  user_data = yamlencode({
    "hostname": "webserver${count.index+1}",
    "package_update": true,
    # "package_upgrade": true,
    "packages": [
      "apache2",
      "libapache2-mod-php",
    ],
    "write_files": [
      {
        "path": "/var/www/html/index.html",
        "content": templatefile("${path.module}/files/index.html", { server_number = count.index + 1 })
      }
    ],
  })
#   lifecycle {
#     ignore_changes = [ user_data ]
#   }
}