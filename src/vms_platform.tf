resource "yandex_compute_instance" "db" {
  name = "${local.project}-${local.env_db}"
  platform_id = var.vm_web_yandex_compute_instance_platform_id
  resources {
    cores         = var.resources_map.vm_db_resources["cores"]
    memory        = var.resources_map.vm_db_resources["memory"]
    core_fraction = var.resources_map.vm_db_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.metadata_map.metadata["serial-port-enable"]
    ssh-keys           = "${local.ssh_key}"
  }
}