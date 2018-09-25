resource "google_compute_instance" "docker-host" {
  name         = "docker-host-${count.index}"
  machine_type = "g1-small"
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

resource "google_compute_address" "docker-host_ip" {
  name = "docker-host-ip"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["docker-host"]
}
