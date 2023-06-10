resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",
    {
      database   =  yandex_compute_instance.for_each-vm
      webservers =  yandex_compute_instance.count-vm
      storage    =  [yandex_compute_instance.storage]
    } 
    )
  filename = "${abspath(path.module)}/hosts.cfg"
}