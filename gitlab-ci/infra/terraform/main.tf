provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

module "docker" {
  source           = "./modules/docker"
  public_key_path  = "${var.public_key_path}"
  zone             = "${var.zone}"
  app_disk_image   = "${var.app_disk_image}"
  private_key_path = "${var.private_key_path}"
}

module "vpc" {
  source          = "./modules/vpc"
  public_key_path = "${var.public_key_path}"
  zone            = "${var.zone}"
  source_ranges   = ["0.0.0.0/0"]
}
