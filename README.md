# Задача 1
- docker pull kibernetique/my-nginx:0.1  

# Задача 2
- высоконагруженное монолитное Java веб-приложение;  
Ответ: Монолит не подразумевает использование контейнеров, нужно использовать виртуальные машины. 
- Nodejs веб-приложение;  
Ответ: Контейнеры, быстро деплоить и просто впишется в микросервисную архитектуру.  
- мобильное приложение c версиями для Android и iOS;  
Ответ: Виртуальные машины, проекты имеют разную архитектуру и их необходимо держать их изолированно.  
- шина данных на базе Apache Kafka;  
Ответ: Виртуальные машины, шина обычно разворачивается на кластерной архитектуре и требовательна к ресурсам.   
- Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana;  
Ответ: Виртуальные машины, проще маштабирование и управление кластером.  
- мониторинг-стек на базе Prometheus и Grafana;  
Ответ: Виртуальные машины или контейнеры, в зависимости от архитектуры на проекте.  
- MongoDB как основное хранилище данных для Java-приложения;  
Ответ: Для локальной разработки быстрее будет использовать контейнер, для пром эксплуатации лучше выбрать виртуальные машины.
- Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry.
Ответ: Виртуальные машины или контейнеры, в зависимости от архитектуры на проекте.  

# Задача 3
- docker run -d--mount src=/Users/yura/devops-netology/Docker/data,target=/data,type=bind centos:latest  
- docker run -d --mount src=/Users/yura/devops-netology/Docker/data,target=/data,type=bind debian:latest  
- docker ps  
CONTAINER ID   IMAGE           COMMAND       CREATED         STATUS         PORTS     NAMES  
36569e16988c   debian:latest   "bash"        8 minutes ago   Up 8 minutes             modest_hermann  
a72b1ba9a712   centos:latest   "/bin/bash"   9 minutes ago   Up 9 minutes             strange_robinson  
- docker exec -it a72b1ba9a712 /bin/bash  
root@a72b1ba9a712:/# touch /data/file_1.txt  
- docker exec -it 36569e16988c /bin/bash  
root@36569e16988c:/# ls -l /data/  
total 0  
-rw-r--r-- 1 root root 0 May 17 20:10 file_1.txt  
-rw-r--r-- 1 root root 0 May 17 19:59 file_2.txt  

# Задача 4
- docker pull kibernetique/ansible:2.9.24