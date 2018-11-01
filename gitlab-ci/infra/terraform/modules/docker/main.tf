resource "google_compute_instance" "docker-host" {
  name         = "docker-host-${count.index}"
  machine_type = "n1-standard-1"
  zone         = "${var.zone}"
  count        = "${var.instance_count}"
  tags         = ["docker-host"]

  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
    }
  }

  metadata {
    ssh-keys = "appuser:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"

    access_config = {}
  }
}

#resource "google_compute_address" "docker-host_ip" {
#  name = "docker-host-ip"
#}
