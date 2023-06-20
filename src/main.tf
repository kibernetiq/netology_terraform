terraform {
  backend "s3" {
  endpoint = "storage.yandexcloud.net"
  bucket   = "tfstate-object"
  region   = "ru-central1-a"
  key      = "terraform.tfstate"
  skip_region_validation      = true
  skip_credentials_validation = true
  dynamodb_endpoint           = "https://docapi.serverless.yandexcloud.net/ru-central1/b1g3kjd2qonru87vca0q/etn0kkc08dpq2u63kual"
  dynamodb_table              = "tfstate-table"
}
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = ">=0.13"
    }
    template = {
      source  = "hashicorp/template"
      version = ">=2.2.0"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=test"
  env_name        = "develop"
  network_id      = module.vpc_dev.vpc_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [module.vpc_dev.subnet_id]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloudinit.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}

#Пример передачи cloud-config в ВМ для демонстрации №3
data "template_file" "cloudinit" {
 template = file("${path.module}/cloud-init.yml")
 vars = {
    public_key = var.public_key
  }
}

module "vpc_dev" {
  source   = "./modules/vpc_dev"
  env_name = "develop"
  zone     = "ru-central1-a"
  cidr     = "10.0.1.0/24"
  network_id = module.vpc_dev.vpc_id
}