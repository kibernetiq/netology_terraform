# Задание 1
1. Возьмите из демонстрации к лекции готовый код для создания ВМ с помощью remote модуля.
2. Создайте 1 ВМ, используя данный модуль. В файле cloud-init.yml необходимо использовать переменную для ssh ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . Воспользуйтесь [примером](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание что ssh-authorized-keys принимает в себя список, а не строку!  
[cloud-init.yml#L8](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/cloud-init.yml#L8)  
[variables.tf#L34-L37](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/variables.tf#L34-L37)  
[main.tf#L36-L41](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/main.tf#L36-L41)  
3. Добавьте в файл cloud-init.yml установку nginx.  
[cloud-init.yml#L13](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/cloud-init.yml#L13)
4. Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t.
```
ubuntu@develop-web-0:~$ sudo nginx -t
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
ubuntu@develop-web-0:~$ systemctl status nginx
● nginx.service - A high performance web server and a reverse proxy server
     Loaded: loaded (/lib/systemd/system/nginx.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2023-06-12 13:40:12 UTC; 27min ago
       Docs: man:nginx(8)
   Main PID: 1553 (nginx)
      Tasks: 3 (limit: 1100)
     Memory: 5.7M
     CGroup: /system.slice/nginx.service
             ├─1553 nginx: master process /usr/sbin/nginx -g daemon on; master_process on;
             ├─1554 nginx: worker process
             └─1555 nginx: worker process

Warning: some journal files were not opened due to insufficient permissions.
```
# Задание 2
1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: одну сеть и одну подсеть в зоне, объявленной при вызове модуля. например: ru-central1-a.  
[main.tf#L10-L19](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/modules/vpc_dev/main.tf#L10-L19)
2. Модуль должен возвращать значения vpc.id и subnet.id  
[modules/vpc_dev/outputs.tf](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/modules/vpc_dev/outputs.tf)
3. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet, созданным модулем.  
[main.tf#L43-L49](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/main.tf#L43-L49)
4. Сгенерируйте документацию к модулю с помощью terraform-docs.  
[modules/vpc_dev/README.md](https://github.com/kibernetiq/devops-netology/blob/terraform-04/src/modules/vpc_dev/README.md)


# Задание 3
1. Выведите список ресурсов в стейте.
```
yura@Skynet src % terraform state list
data.template_file.cloudinit
module.test-vm.data.yandex_compute_image.my_image
module.test-vm.yandex_compute_instance.vm[0]
module.test-vm.yandex_compute_instance.vm[1]
module.vpc_dev.yandex_vpc_network.develop
module.vpc_dev.yandex_vpc_subnet.develop
```
2. Удалите из стейта модуль vpc.
```
yura@Skynet src % terraform state rm 'module.vpc_dev'
Removed module.vpc_dev.yandex_vpc_network.develop
Removed module.vpc_dev.yandex_vpc_subnet.develop
Successfully removed 2 resource instance(s).
```
3. Импортируйте его обратно. Проверьте terraform plan - изменений быть не должно. Приложите список выполненных команд и вывод.
```
yura@Skynet src % terraform import 'module.vpc_dev.yandex_vpc_network.develop' enp8mmedsqmpj0ffm73g
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=77ee049fdc085807806269aa7e5c93bad569f64cba03c43177fc7f6568115b4c]
module.vpc_dev.yandex_vpc_network.develop: Importing from ID "enp8mmedsqmpj0ffm73g"...
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_network.develop: Import prepared!
  Prepared yandex_vpc_network for import
module.vpc_dev.yandex_vpc_network.develop: Refreshing state... [id=enp8mmedsqmpj0ffm73g]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 3s [id=fd83vhe8fsr4pe98v6oj]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```
```
yura@Skynet src % terraform import 'module.vpc_dev.yandex_vpc_subnet.develop' e9bmbtqjoi4mkgbsb9eh
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=77ee049fdc085807806269aa7e5c93bad569f64cba03c43177fc7f6568115b4c]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_subnet.develop: Importing from ID "e9bmbtqjoi4mkgbsb9eh"...
module.vpc_dev.yandex_vpc_subnet.develop: Import prepared!
  Prepared yandex_vpc_subnet for import
module.vpc_dev.yandex_vpc_subnet.develop: Refreshing state... [id=e9bmbtqjoi4mkgbsb9eh]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 2s [id=fd83vhe8fsr4pe98v6oj]

Import successful!

The resources that were imported are shown above. These resources are now in
your Terraform state and will henceforth be managed by Terraform.
```
```
yura@Skynet src % terraform plan
data.template_file.cloudinit: Reading...
data.template_file.cloudinit: Read complete after 0s [id=77ee049fdc085807806269aa7e5c93bad569f64cba03c43177fc7f6568115b4c]
module.test-vm.data.yandex_compute_image.my_image: Reading...
module.vpc_dev.yandex_vpc_network.develop: Refreshing state... [id=enp8mmedsqmpj0ffm73g]
module.test-vm.data.yandex_compute_image.my_image: Read complete after 2s [id=fd83vhe8fsr4pe98v6oj]
module.vpc_dev.yandex_vpc_subnet.develop: Refreshing state... [id=e9bmbtqjoi4mkgbsb9eh]
module.test-vm.yandex_compute_instance.vm[1]: Refreshing state... [id=fhmccq27v79cd72ui35p]
module.test-vm.yandex_compute_instance.vm[0]: Refreshing state... [id=fhmhs66rmf9okntajuup]

No changes. Your infrastructure matches the configuration.

Terraform has compared your real infrastructure against your configuration and found no differences, so no changes are needed.
```