# Задание 1
2. personal.auto.tfvars
3. "result": "7nELnJ823R66lP48"
4. Первая ошибка сообщает что все блоки ресурсов должны иметь 2 метки, тип и имя.  
Вторая ошибка сообщает что имя должно начинаться с буквы или символа подчеркивания и может содержать только буквы, цифры, символы подчеркивания и тире. Имя было указанно не верно.  
Третья ошибка означала что таких параметров нет random_string_fake.resuld
5. 
```
yura@Skynet src % docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
61862cc8334d   c42efe0b5438   "/docker-entrypoint.…"   6 seconds ago   Up 5 seconds   0.0.0.0:8000->80/tcp   example_7nELnJ823R66lP48
```
6. 
```
yura@Skynet src % docker ps
CONTAINER ID   IMAGE          COMMAND                  CREATED         STATUS         PORTS                  NAMES
0d7763a9b520   c42efe0b5438   "/docker-entrypoint.…"   4 seconds ago   Up 4 seconds   0.0.0.0:8000->80/tcp   example_7nELnJ823R66lP48
```
Опасность авто-подтверждения заключается в том что если кто-то поменял конфигурацию, эти правки сразу применятся после отображения планирования что может добавить проблем  

7. 
```
{
  "version": 4,
  "terraform_version": "1.4.6",
  "serial": 15,
  "lineage": "0131c397-181f-fe36-8b2e-1e30797e3d2e",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```
8. Потому что установлен параметр keep_locally = true  
https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/image#keep_locally

# Задание 2
Не могу выполнить, личный компьютер на Apple Silicon m2 и получаю ошибку:
```
yura@Skynet src % terraform init -upgrade

Initializing the backend...

Initializing provider plugins...
- Finding shekeriev/virtualbox versions matching "0.0.4"...
╷
│ Error: Incompatible provider version
│
│ Provider registry.terraform.io/shekeriev/virtualbox v0.0.4 does not have a package available for your current platform, darwin_arm64.
│
│ Provider releases are separate from Terraform CLI releases, so not all providers are available for all platforms. Other versions of this provider may have
│ different platforms supported.
```
Но с документацией ознакомился)