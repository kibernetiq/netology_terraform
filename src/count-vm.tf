resource "yandex_compute_instance" "count-vm" {
  count = 2
  name = "web-${count.index + 1}"
  platform_id = var.yandex_compute_instance_platform_id
  resources {
    cores         = 2
    memory        = 2
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
    subnet_id              = yandex_vpc_subnet.develop.id
    nat                    = true
    security_group_ids     = "${yandex_vpc_security_group.example.*.id}"
  }
  metadata = {
    ssh-keys = "${local.ssh_user}:${local.ssh_key}"
  }
}