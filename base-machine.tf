
resource "digitalocean_droplet" "base-machine" {
    image = "34335318"
    name = "samuha-droplet"
    region = "sgp1"
    size = "s-2vcpu-4gb"
    private_networking = true
    ssh_keys = [
      "${var.ssh_fingerprint}"
    ]
  connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "5m"
  }
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }
}