resource "yandex_compute_instance" "for_each-vm" {
  depends_on = [yandex_compute_instance.count-vm]
  for_each = { 
    for vm in var.name_and_resources_list: vm.vm_name => vm
    }
  name = "${each.value.vm_name}"
  platform_id = var.yandex_compute_instance_platform_id
  resources {
    cores         = "${each.value.cpu}"
    memory        = "${each.value.ram}"
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = "${each.value.disk}"
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
}