# Задание 1
1. Изучите проект.
2. Наполните файл personal.auto.tfvars
3. Инициализируйте проект, выполните код (он выполнится даже если доступа к preview нет).

<p align="center">
  <img width="1200" height="600" src="./Screenshots/1.png">
</p>

# Задание 2
1. Создайте файл count-vm.tf. Опишите в нем создание двух одинаковых ВМ web-1 и web-2(не web-0 и web-1!), с минимальными параметрами, используя мета-аргумент count loop. Назначьте ВМ созданную в 1-м задании группу безопасности.  
[count-vm.tf](https://github.com/kibernetiq/devops-netology/blob/terraform-03/src/count-vm.tf)
2. Создайте файл for_each-vm.tf. Опишите в нем создание 2 ВМ с именами "main" и "replica" разных по cpu/ram/disk , используя мета-аргумент for_each loop. Используйте переменную типа list(object({ vm_name=string, cpu=number, ram=number, disk=number })). При желании внесите в переменную все возможные параметры.  
[for_each-vm.tf](https://github.com/kibernetiq/devops-netology/blob/terraform-03/src/for_each-vm.tf)
3. ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1.  
[for_each-vm.tf#L2](https://github.com/kibernetiq/devops-netology/blob/terraform-03/src/for_each-vm.tf#L2)
4. Используйте функцию file в local переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ №2.  
[locals.tf#L2](https://github.com/kibernetiq/devops-netology/blob/terraform-03/src/locals.tf#L2)
5. Инициализируйте проект, выполните код.  
<p align="center">
  <img width="1200" height="600" src="./Screenshots/2.png">
</p>

# Задание 3
1. Создайте 3 одинаковых виртуальных диска, размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .  
[disk_vm.tf#L1-L6](https://github.com/kibernetiq/devops-netology/blob/terraform-03/src/disk_vm.tf#L1-L6)
2. Создайте в том же файле одну ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.  
[disk_vm.tf#L30-L35](https://github.com/kibernetiq/devops-netology/blob/terraform-03/src/disk_vm.tf#L30-L35)

# Задание 4
1. В файле ansible.tf создайте inventory-файл для ansible. Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции. Готовый код возьмите из демонстрации к лекции demonstration2. Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2.(т.е. 5 ВМ)
2. Инвентарь должен содержать 3 группы [webservers], [databases], [storage] и быть динамическим, т.е. обработать как группу из 2-х ВМ так и 999 ВМ.
3. Выполните код. Приложите скриншот получившегося файла.
<p align="center">
  <img width="1200" height="600" src="./Screenshots/3.png">
</p>