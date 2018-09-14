output "docker_external_ip" {
  value = "${module.docker.docker_external_ip}"
}

output "runners_external_ips" {
  value = "${module.gitlab-runner.runners_external_ip}"
}
