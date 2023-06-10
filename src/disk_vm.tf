resource "yandex_compute_disk" "default" {
  count    =  3
  name     = "disk-${count.index}"
  type     = "network-hdd"
  size     = 1
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
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
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
    metadata = {
    ssh-keys = "${local.ssh_user}:${local.ssh_key}"
  }
  dynamic secondary_disk {
    for_each = yandex_compute_disk.default
    content {
      disk_id = secondary_disk.value.id
    }
  }
}