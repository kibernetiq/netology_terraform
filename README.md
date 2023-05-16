# Задача 1
- Скорость и уменьшение затрат  
Масштабируемость  
Безопасность  
Восстановление в аварийных ситуациях  

- Идемпотентность

# Задача 2
- Не нужно ставить агентов на управляемые хосты, доступ по ssh
- На мой взгляд, следует использовать то, что больше подходит к конкретному случаю или комбинировать.

# Задача 3
- god@netology:~$ virtualbox --help | head -n 1 | awk '{print $NF}'  
v6.1.44 
- god@netology:~$ vagrant --version  
Vagrant 2.3.4   
- god@netology:~$ terraform --version  
Terraform v1.4.6  
on linux_amd64  
- god@netology:~$ ansible --version  
ansible [core 2.14.5]  
  config file = /etc/ansible/ansible.cfg  
  configured module search path = ['/home/god/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']  
  ansible python module location = /usr/lib/python3/dist-packages/ansible  
  ansible collection location = /home/god/.ansible/collections:/usr/share/ansible/collections  
  executable location = /usr/bin/ansible  
  python version = 3.10.6 (main, Mar 10 2023, 10:55:28) [GCC 11.3.0] (/usr/bin/python3)  
  jinja version = 3.0.3  
  libyaml = True  

# Задача 4
- Выполнено