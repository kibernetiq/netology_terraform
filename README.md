# Задача 1
- global это означает, что данный сервис будет запущен ровно в одном экземпляре на всех возможных нодах. А replicated означает, что n-ое кол-во контейнеров для данного сервиса будет запущено на всех доступных нодах.  
- Лидер нода выбирается из управляющих нод путем Raft согласованного алгоритма.  
- Overlay-сеть создает подсеть, которую могут использовать контейнеры в разных хостах swarm-кластера. Контейнеры на разных физических хостах могут обмениваться данными по overlay-сети (если все они прикреплены к одной сети).

# Задача 2
```
god@manager:~$ sudo docker node ls
ID                            HOSTNAME   STATUS    AVAILABILITY   MANAGER STATUS   ENGINE VERSION
7attw4yl9rneo4dnys6m66d2g *   manager    Ready     Active         Leader           20.10.24
nbhr04ml969fuiw6af58emwcl     node1      Ready     Active                          20.10.24
45hzkf89ggbcfnz5a63emqucq     node2      Ready     Active                          20.10.24
```
# Задача 3
```
[centos@node01 ~]$ sudo docker service ls
ID             NAME                                MODE         REPLICAS   IMAGE                                          PORTS
yi2k47f5153e   swarm_monitoring_alertmanager       replicated   1/1        stefanprodan/swarmprom-alertmanager:v0.14.0
oxld9zjammdn   swarm_monitoring_caddy              replicated   1/1        stefanprodan/caddy:latest                      *:3000->3000/tcp, *:9090->9090/tcp, *:9093-9094->9093-9094/tcp
uagt1284w2gt   swarm_monitoring_cadvisor           global       6/6        google/cadvisor:latest
yq22smwzka5s   swarm_monitoring_dockerd-exporter   global       6/6        stefanprodan/caddy:latest
xue27lukoy63   swarm_monitoring_grafana            replicated   1/1        stefanprodan/swarmprom-grafana:5.3.4
i18ne5wfrl5c   swarm_monitoring_node-exporter      global       6/6        stefanprodan/swarmprom-node-exporter:v0.16.0
je7xwleajely   swarm_monitoring_prometheus         replicated   1/1        stefanprodan/swarmprom-prometheus:v2.5.0
mna5dpzg4l3k   swarm_monitoring_unsee              replicated   1/1        cloudflare/unsee:v0.8.0
```
# Задача 4
- Команда генерирует ключ которым можно разблокировать swarm manager после его перезапуска.  
- Служит для защиты чувствительных данных.