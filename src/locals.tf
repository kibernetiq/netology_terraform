locals {
  project = "netology-develop-platform"
  env_web = "web"
  env_db  = "db"
  ssh_key = "ubuntu:${var.vms_ssh_root_key}"
}