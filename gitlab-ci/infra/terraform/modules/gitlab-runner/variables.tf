variable public_key_path {
  description = "Path to the public key used to connect to instance"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable zone {
  description = "Zone"
}

variable app_disk_image {
  description = "Disk image for docker"
  default     = "docker-host"
}

variable source_ranges {
  description = "Allowed IP addresses"
  default     = ["0.0.0.0/0"]
}

variable "instance_count" {
  description = "Number of GCP instances"
  default     = "2"
}
