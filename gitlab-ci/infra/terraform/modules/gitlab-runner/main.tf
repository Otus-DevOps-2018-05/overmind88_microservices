resource "google_compute_instance" "gitlab-runner" {
  name         = "gitlab-runner-${count.index}"
  machine_type = "g1-small"
  zone         = "${var.zone}"
  count        = "${var.instance_count}"
  tags         = ["gitlab-runner"]

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

#resource "google_compute_address" "gitlab-runner_ip" {
#  name = "gitlab-runner-ip"
#}
